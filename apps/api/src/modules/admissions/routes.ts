import { Router } from 'express';

export const admissionsRouter = Router();

admissionsRouter.get('/', (_req, res) => {
  res.json({ module: 'admissions', items: [] });
});

admissionsRouter.post('/', (req, res) => {
  res.status(201).json({ module: 'admissions', payload: req.body, message: 'Created (stub for MVP).' });
});
