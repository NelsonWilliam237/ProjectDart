from datetime import datetime, timezone
import uuid

from fastapi import Depends, FastAPI
from pydantic import BaseModel
from sqlalchemy import Column, DateTime, Float, String, Text
from sqlalchemy.dialects.postgresql import UUID
from sqlalchemy.orm import Session

from backend.shared.database import Base, engine, get_db


class Transaction(Base):
    __tablename__ = "transactions"
    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    user_id = Column(UUID(as_uuid=True), index=True, nullable=False)
    wallet_id = Column(UUID(as_uuid=True), index=True, nullable=False)
    category = Column(String, nullable=False)
    amount = Column(Float, nullable=False)
    description = Column(Text)
    detected_anomaly = Column(String, default="none")
    created_at = Column(DateTime, default=lambda: datetime.now(timezone.utc), nullable=False)


class TransactionPayload(BaseModel):
    user_id: str
    wallet_id: str
    category: str
    amount: float
    description: str = ""


app = FastAPI(title="Finexia Transaction Service")
Base.metadata.create_all(bind=engine)


@app.get("/health")
def healthcheck():
    return {"status": "ok", "service": "transaction"}


@app.post("/transactions")
def create_transaction(payload: TransactionPayload, db: Session = Depends(get_db)):
    anomaly = "high_amount" if payload.amount > 2000 else "none"
    tx = Transaction(**payload.model_dump(), detected_anomaly=anomaly)
    db.add(tx)
    db.commit()
    db.refresh(tx)
    return tx


@app.get("/transactions/{user_id}")
def list_transactions(user_id: str, db: Session = Depends(get_db)):
    return db.query(Transaction).filter(Transaction.user_id == user_id).all()
