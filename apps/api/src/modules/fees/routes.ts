import { Router } from 'express';

export const feesRouter = Router();

feesRouter.get('/', (_req, res) => {
  res.json({ module: 'fees', items: [] });
});

feesRouter.post('/', (req, res) => {
  res.status(201).json({ module: 'fees', payload: req.body, message: 'Created (stub for MVP).' });
});
