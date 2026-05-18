import { Router } from 'express';

export const crmRouter = Router();

crmRouter.get('/', (_req, res) => {
  res.json({ module: 'crm', items: [] });
});

crmRouter.post('/', (req, res) => {
  res.status(201).json({ module: 'crm', payload: req.body, message: 'Created (stub for MVP).' });
});
