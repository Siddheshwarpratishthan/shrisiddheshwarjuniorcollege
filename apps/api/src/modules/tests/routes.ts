import { Router } from 'express';

export const testsRouter = Router();

testsRouter.get('/', (_req, res) => {
  res.json({ module: 'tests', items: [] });
});

testsRouter.post('/', (req, res) => {
  res.status(201).json({ module: 'tests', payload: req.body, message: 'Created (stub for MVP).' });
});
