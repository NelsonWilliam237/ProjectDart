from fastapi import FastAPI, WebSocket

app = FastAPI(title="Finexia Notification Service")


@app.get("/health")
def healthcheck():
    return {"status": "ok", "service": "notification"}


@app.websocket("/ws/alerts")
async def alerts_ws(websocket: WebSocket):
    await websocket.accept()
    await websocket.send_json({"type": "budget_alert", "message": "Monthly budget at 85%"})
    while True:
        data = await websocket.receive_text()
        await websocket.send_text(f"ack:{data}")
