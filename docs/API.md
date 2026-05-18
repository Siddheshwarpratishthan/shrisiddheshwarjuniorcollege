# API Documentation (MVP)

## Auth
- `POST /api/auth/login-otp`
- `POST /api/auth/verify-otp`

## Admissions
- `GET /api/admissions`
- `POST /api/admissions`

## Fees
- `GET /api/fees`
- `POST /api/fees`

## Attendance
- `GET /api/attendance`
- `POST /api/attendance`

## Tests
- `GET /api/tests`
- `POST /api/tests`

## CRM
- `GET /api/crm`
- `POST /api/crm`

## Standards
- JWT Bearer auth
- Branch-scoped access control
- Response envelope: `{ data, meta, error }` (to be standardized in next iteration)
