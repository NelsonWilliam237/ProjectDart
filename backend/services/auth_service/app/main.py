from fastapi import Depends, FastAPI, HTTPException
from pydantic import BaseModel, EmailStr
from sqlalchemy import Boolean, Column, DateTime, String
from sqlalchemy.dialects.postgresql import UUID
from sqlalchemy.orm import Session
import uuid
from datetime import datetime, timezone

from backend.shared.database import Base, engine, get_db
from backend.shared.security import (
    create_access_token,
    create_refresh_token,
    hash_password,
    verify_password,
)


class UserCredential(Base):
    __tablename__ = "users"
    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    email = Column(String, unique=True, index=True, nullable=False)
    password_hash = Column(String, nullable=False)
    role = Column(String, default="user", nullable=False)
    is_2fa_enabled = Column(Boolean, default=False)
    created_at = Column(DateTime, default=lambda: datetime.now(timezone.utc), nullable=False)


class RegisterRequest(BaseModel):
    email: EmailStr
    password: str


class LoginRequest(BaseModel):
    email: EmailStr
    password: str


app = FastAPI(title="Finexia Auth Service")
Base.metadata.create_all(bind=engine)


@app.get("/health")
def healthcheck():
    return {"status": "ok", "service": "auth"}


@app.post("/auth/register")
def register(payload: RegisterRequest, db: Session = Depends(get_db)):
    existing = db.query(UserCredential).filter(UserCredential.email == payload.email).first()
    if existing:
        raise HTTPException(status_code=400, detail="Email already exists")

    credential = UserCredential(email=payload.email, password_hash=hash_password(payload.password))
    db.add(credential)
    db.commit()
    db.refresh(credential)
    return {"user_id": str(credential.id), "email": credential.email, "role": credential.role}


@app.post("/auth/login")
def login(payload: LoginRequest, db: Session = Depends(get_db)):
    user = db.query(UserCredential).filter(UserCredential.email == payload.email).first()
    if not user or not verify_password(payload.password, user.password_hash):
        raise HTTPException(status_code=401, detail="Invalid credentials")

    return {
        "access_token": create_access_token(str(user.id)),
        "refresh_token": create_refresh_token(str(user.id)),
        "token_type": "bearer",
        "role": user.role,
    }
