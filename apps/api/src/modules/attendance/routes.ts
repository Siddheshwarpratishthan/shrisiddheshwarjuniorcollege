import { Router } from 'express';

export const attendanceRouter = Router();

attendanceRouter.get('/', (_req, res) => {
  res.json({ module: 'attendance', items: [] });
});

attendanceRouter.post('/', (req, res) => {
  res.status(201).json({ module: 'attendance', payload: req.body, message: 'Created (stub for MVP).' });
});
