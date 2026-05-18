import express from 'express';
import cors from 'cors';
import helmet from 'helmet';
import { createServer } from 'http';
import { Server } from 'socket.io';
import { admissionsRouter } from './modules/admissions/routes';
import { feesRouter } from './modules/fees/routes';
import { attendanceRouter } from './modules/attendance/routes';
import { testsRouter } from './modules/tests/routes';
import { crmRouter } from './modules/crm/routes';

const app = express();
app.use(helmet());
app.use(cors());
app.use(express.json({ limit: '5mb' }));

app.get('/health', (_req, res) => res.json({ status: 'ok', app: 'vibrant-api' }));
app.use('/api/admissions', admissionsRouter);
app.use('/api/fees', feesRouter);
app.use('/api/attendance', attendanceRouter);
app.use('/api/tests', testsRouter);
app.use('/api/crm', crmRouter);

const server = createServer(app);
const io = new Server(server, { cors: { origin: '*' } });
io.on('connection', (socket) => socket.emit('connected', { ok: true }));

const port = process.env.PORT || 4000;
server.listen(port, () => console.log(`API running on ${port}`));

export default app;
