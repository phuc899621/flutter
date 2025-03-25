const express = require('express');
const bodyPaser=require('body-parser');
const userRouter=require('./routers/user.router');

const app=express();
app.use(bodyPaser.json);
app.use('/user',userRouter);
module.exports=app;