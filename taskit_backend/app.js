const express = require('express');
const bodyPaser=require('body-parser');
const userRouter=require('./routers/user.router');
const taskRouter=require('./routers/task.router');
const aiRouter=require('./routers/ai.router');

const app=express();
app.use(bodyPaser.json());
app.use('/user',userRouter);
app.use('/task',taskRouter);
app.use('/ai',aiRouter);
module.exports=app;