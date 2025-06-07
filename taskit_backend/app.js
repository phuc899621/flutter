import express from 'express';
import bodyParser from 'body-parser';
import userRouter from './routers/user.router.js';
import taskRouter from './routers/task.router.js';
import aiRouter from './routers/ai.router.js';
import categoryRouter from './routers/category.router.js';
import settingRouter from './routers/setting.router.js';
import subtaskRouter from './routers/subtask.router.js';
const app=express();
app.use(bodyParser.json());
app.use('/user',userRouter);
app.use('/task',taskRouter);
app.use('/ai',aiRouter);
app.use('/category',categoryRouter);
app.use('/uploads', express.static('uploads'));
app.use('/setting',settingRouter);
app.use('/subtask',subtaskRouter);

export default app;