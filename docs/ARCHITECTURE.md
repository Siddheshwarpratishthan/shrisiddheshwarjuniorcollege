# Vibrant Academy Baramati ERP+LMS+CRM Architecture

## 1) Platform Vision
A modular, multi-tenant (branch-aware) ecosystem for Kota-pattern coaching operations with deep analytics, test intelligence, and AI assistance.

## 2) Monorepo Layout
- `apps/web`: Next.js super-admin/staff portal + PWA.
- `apps/api`: Express.js REST API + Socket.io + background workers.
- `apps/mobile`: React Native student/parent app.
- `packages/types`: Shared TypeScript domain models.
- `docs`: Architecture, schema, APIs, wireframes, roadmap.
- `infra`: Docker, K8s manifests, CI/CD templates.

## 3) Domain Modules
1. IAM + RBAC
2. Branch & Master Data
3. Student Lifecycle (admission -> alumni)
4. Fees & Billing (Razorpay/UPI/Cash/Card/Bank)
5. Attendance (RFID/QR/manual)
6. Tests (CBT + OMR pipeline)
7. Question Bank (LaTeX + taxonomy)
8. Faculty & Academics
9. LMS delivery
10. CRM + WhatsApp automation
11. Reports & Exports
12. AI services

## 4) Security Model
- JWT access + refresh token rotation.
- OTP login and optional OAuth.
- RBAC at route + resource level.
- Input validation (Zod), SQL injection mitigation (parameterized queries), Helmet, CORS policy.
- Rate limiting + brute-force lockouts.
- File upload scanning with strict MIME whitelist.
- Audit logs for all write operations.

## 5) Data & Performance
- PostgreSQL (primary relational store).
- Redis for cache, sessions, queues, OTP expiry, and rate-limit counters.
- Indexes on branch, student, due-date, test-date, lead-status.
- Materialized views for heavy dashboards.

## 6) Real-time & Notifications
- Socket.io for live attendance/test status/alerts.
- Notification service for push, email, SMS, WhatsApp.

## 7) AI Layer
- OpenAI integration with service boundaries:
  - Performance prediction
  - Personalized study planner
  - DPP/question generation
  - Fee defaulter and attendance risk scoring
- Guardrails + explainability note attached to predictions.

## 8) MVP Phasing
- **Phase 1**: Admission, Fees, Attendance, Test, CRM.
- **Phase 2**: LMS, AI analytics, Mobile enrichment.
- **Phase 3**: Advanced AI automations, franchise multi-branch scaling.
