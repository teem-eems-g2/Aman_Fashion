import express, { Request, Response } from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import authRouter from './routes/auth.routes';
import adminAuthRouter from './routes/adminAuth.routes';
import categoryRouter from './routes/category.routes';
import adminCategoryRouter from './routes/adminCategory.routes';

dotenv.config();

const app = express();
const PORT = process.env.PORT || 5000;

app.use(cors());
app.use(express.json());

app.get('/health', (req: Request, res: Response) => {
  res.status(200).json({ status: 'ok' });
});

app.use('/api/auth', authRouter);
app.use('/api/admin/auth', adminAuthRouter);
app.use('/api/categories', categoryRouter);
app.use('/api/admin/categories', adminCategoryRouter);

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
