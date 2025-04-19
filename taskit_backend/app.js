const express = require('express');
const bodyPaser=require('body-parser');
const userRouter=require('./routers/user.router');
const taskRouter=require('./routers/task.router');

const app=express();
app.use(bodyPaser.json());
app.use('/user',userRouter);
app.use('/task',taskRouter);
module.exports=app;