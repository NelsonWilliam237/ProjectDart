from datetime import datetime, timezone
import uuid

from fastapi import Depends, FastAPI, HTTPException
from pydantic import BaseModel, Field
from sqlalchemy import Column, DateTime, String, JSON
from sqlalchemy.dialects.postgresql import UUID
from sqlalchemy.orm import Session

from backend.shared.database import Base, engine, get_db


class UserProfile(Base):
    __tablename__ = "user_profiles"
    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    user_id = Column(UUID(as_uuid=True), index=True, nullable=False)
    full_name = Column(String, nullable=False)
    preferences = Column(JSON, default=dict)
    created_at = Column(DateTime, default=lambda: datetime.now(timezone.utc), nullable=False)


class ProfilePayload(BaseModel):
    user_id: str
    full_name: str = Field(min_length=2)
    preferences: dict = Field(default_factory=dict)


app = FastAPI(title="Finexia User Service")
Base.metadata.create_all(bind=engine)


@app.get("/health")
def healthcheck():
    return {"status": "ok", "service": "user"}


@app.post("/users/profile")
def create_or_update_profile(payload: ProfilePayload, db: Session = Depends(get_db)):
    profile = db.query(UserProfile).filter(UserProfile.user_id == payload.user_id).first()
    if profile:
        profile.full_name = payload.full_name
        profile.preferences = payload.preferences
    else:
        profile = UserProfile(
            user_id=payload.user_id,
            full_name=payload.full_name,
            preferences=payload.preferences,
        )
        db.add(profile)

    db.commit()
    db.refresh(profile)
    return profile


@app.get("/users/{user_id}")
def get_profile(user_id: str, db: Session = Depends(get_db)):
    profile = db.query(UserProfile).filter(UserProfile.user_id == user_id).first()
    if not profile:
        raise HTTPException(status_code=404, detail="Profile not found")
    return profile
