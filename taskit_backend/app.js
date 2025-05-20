const express = require('express');
const bodyPaser=require('body-parser');
const userRouter=require('./routers/user.router');
const taskRouter=require('./routers/task.router');
const aiRouter=require('./routers/ai.router');
const categoryRouter=require('./routers/category.router');
const subtaskRouter=require('./routers/subtask.router');

const app=express();
app.use(bodyPaser.json());
app.use('/user',userRouter);
app.use('/task',taskRouter);
app.use('/ai',aiRouter);
app.use('/category',categoryRouter);
app.use('/subtask',subtaskRouter);
module.exports=app;