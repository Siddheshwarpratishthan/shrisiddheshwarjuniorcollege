# Vibrant Academy Baramati - Coaching ERP + LMS + CRM

Enterprise-grade monorepo starter for a Kota-pattern coaching ecosystem.

> Branding cleanup: legacy `shrisiddheshwarjuniorcollege` text has been removed; this repo now uses only Vibrant Academy branding.

## Stack
- Web: Next.js + React + TypeScript
- API: Node.js + Express + PostgreSQL + Redis + Socket.io
- Mobile: React Native (planned module)
- Infra: Docker + Kubernetes-ready manifests

## Modules (MVP Phase 1)
- Admissions
- Fees
- Attendance
- Tests
- CRM

## Quick Start
```bash
npm install
npm run dev
```

## Docker
```bash
docker compose -f infra/docker/docker-compose.yml up --build
```

## Documentation
- Architecture: `docs/ARCHITECTURE.md`
- Database Schema: `docs/DATABASE_SCHEMA.sql`
- API docs: `docs/API.md`
- UI wireframes: `docs/UI_WIREFRAMES.md`
- Seed data and credentials: `docs/SEED_DATA.md`

## Scalability Plan
- Phase 2: LMS + AI analytics + mobile deep features
- Phase 3: Franchise multi-branch + advanced AI automation
