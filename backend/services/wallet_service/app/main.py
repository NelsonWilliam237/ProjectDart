from datetime import datetime, timezone
import uuid

from fastapi import Depends, FastAPI
from pydantic import BaseModel
from sqlalchemy import Column, DateTime, Float, String
from sqlalchemy.dialects.postgresql import UUID
from sqlalchemy.orm import Session

from backend.shared.database import Base, engine, get_db


class Wallet(Base):
    __tablename__ = "wallets"
    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    user_id = Column(UUID(as_uuid=True), index=True, nullable=False)
    provider = Column(String, nullable=False)
    wallet_type = Column(String, nullable=False)
    balance = Column(Float, default=0.0)
    synced_at = Column(DateTime, default=lambda: datetime.now(timezone.utc), nullable=False)


class WalletPayload(BaseModel):
    user_id: str
    provider: str
    wallet_type: str
    balance: float


app = FastAPI(title="Finexia Wallet Service")
Base.metadata.create_all(bind=engine)


@app.get("/health")
def healthcheck():
    return {"status": "ok", "service": "wallet"}


@app.post("/wallets")
def add_wallet(payload: WalletPayload, db: Session = Depends(get_db)):
    wallet = Wallet(**payload.model_dump())
    db.add(wallet)
    db.commit()
    db.refresh(wallet)
    return wallet


@app.get("/wallets/{user_id}")
def list_wallets(user_id: str, db: Session = Depends(get_db)):
    return db.query(Wallet).filter(Wallet.user_id == user_id).all()
