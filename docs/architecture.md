# Finexia architecture details

## Backend services contracts
- `POST /auth/register`, `POST /auth/login`
- `POST /users/profile`, `GET /users/{user_id}`
- `POST /wallets`, `GET /wallets/{user_id}`
- `POST /transactions`, `GET /transactions/{user_id}`
- `POST /analytics/score`
- `WS /ws/alerts`

## Data model
See `backend/schema.sql` for full DDL including:
- users
- wallets
- transactions
- categories
- budgets
- alerts
- analytics_reports

## Scalability strategy
- Stateless API pods (horizontal scaling friendly)
- Redis for cache/session-like hot reads
- RabbitMQ + Celery for async enrichment and provider sync
- Nginx reverse proxy for route partition and edge controls

## Observability readiness
- Structured JSON logs per service
- Prometheus scrape annotations (to be added in K8s manifests)
- ELK/OpenSearch ingestion compatibility
