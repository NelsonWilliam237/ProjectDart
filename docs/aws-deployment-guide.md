# AWS deployment guide (production path)

## Recommended stack
- **Frontend**: Flutter Web on S3 + CloudFront.
- **API Gateway Layer**: ALB + Nginx ingress.
- **Microservices**: EKS (or ECS Fargate for simpler operations).
- **Datastore**: Amazon RDS PostgreSQL.
- **Cache**: ElastiCache Redis.
- **Broker**: Amazon MQ (RabbitMQ) or self-managed on EKS.
- **Observability**: CloudWatch + OpenSearch (ELK compatible).

## Steps
1. Build and push images to ECR per service.
2. Provision VPC, private subnets, NAT gateway, security groups.
3. Deploy PostgreSQL (RDS) with automated backups + Multi-AZ.
4. Deploy Redis and RabbitMQ managed services.
5. Apply Kubernetes manifests in `infra/k8s` and extend per service.
6. Configure cert-manager + ACM certificate for HTTPS.
7. Configure autoscaling:
   - HPA on API services (CPU + custom latency metric).
   - Cluster autoscaler for node group elasticity.
8. Configure secrets in AWS Secrets Manager + CSI Driver.
9. Deploy frontend to S3, invalidate CloudFront cache.
10. Add monitoring alerts (error rate, p95 latency, failed jobs).

## Hardening checklist
- Enforce TLS 1.2+ end-to-end.
- Enable JWT key rotation with KMS-backed secret.
- Enable WAF managed rules.
- Add rate limiting (Nginx/ALB + app-level).
- Encrypt RDS and snapshots.
- Enable audit logs and retention policy.
