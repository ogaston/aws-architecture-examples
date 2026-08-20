# AWS Architecture Examples

A curated reference repository of commonly used AWS architecture patterns, trade-offs, and IaC templates.

---

## Architecture Catalog

### Foundational

| Scenario | Primary Services | Status |
| :--- | :--- | :--- |
| **[Static Web Hosting & CDN](foundational/static-web-hosting-cdn/README.md)** | S3, CloudFront, Route 53, ACM | Not Ready |
| **[Two-Tier Resilient Web App](foundational/two-tier-high-available-api/README.md)** | ALB, EC2 ASG, RDS Multi-AZ | Ready |
| **Serverless REST API** | API Gateway, Lambda, DynamoDB | Not Ready |
| **Storage Lifecycle & Archival** | S3 Standard/IA/Glacier | Not Ready |

### Intermediate

| Scenario | Primary Services | Status |
| :--- | :--- | :--- |
| **Async Order Processing** | SQS, Lambda, DLQ, CloudWatch | Not Ready |
| **Fan-Out Notification System** | SNS, SQS, Filter Policies | Not Ready |
| **Database Caching Layer** | ElastiCache Redis, RDS PostgreSQL | Not Ready |
| **Cross-Account Access** | IAM Roles, KMS Grants, S3 | Not Ready |
| **Private Network Endpoints** | PrivateLink, S3 Gateway Endpoint | Not Ready |

### Advanced

| Scenario | Primary Services | Status |
| :--- | :--- | :--- |
| **Event-Driven Microservices** | Step Functions, EventBridge, Lambda | Not Ready |
| **Hub-and-Spoke Network** | Transit Gateway, VPC Peering, Direct Connect | Not Ready |
| **Real-Time Analytics Pipeline** | Kinesis Streams/Firehose, S3, Athena | Not Ready |
| **Cross-Region Disaster Recovery** | Route 53 Failover, Aurora Global DB | Not Ready |
| **High-Performance Storage (HPC)** | FSx for Lustre, Placement Groups, S3 | Not Ready |
| **Multi-Account Governance** | AWS Organizations, SCPs, CloudTrail | Not Ready |

---

## Repository Structure

```text
aws-architecture-examples/
└── foundational/
    ├── static-web-hosting-cdn/       # Static SPA with CDN delivery
    └── two-tier-high-available-api/  # Multi-tier web app with HA compute
```
