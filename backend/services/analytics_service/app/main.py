from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI(title="Finexia Analytics Service")


class AnalyticsRequest(BaseModel):
    monthly_income: float
    monthly_expense: float
    savings_rate: float


@app.get("/health")
def healthcheck():
    return {"status": "ok", "service": "analytics"}


@app.post("/analytics/score")
def calculate_score(payload: AnalyticsRequest):
    base = max(0, min(100, int(50 + payload.savings_rate * 0.5 - (payload.monthly_expense / max(payload.monthly_income, 1)) * 15)))
    recommendation = "Increase emergency savings" if base < 60 else "Keep your current investment strategy"
    return {
        "financial_score": base,
        "projection_3m": round(payload.monthly_income - payload.monthly_expense, 2) * 3,
        "recommendation": recommendation,
    }
