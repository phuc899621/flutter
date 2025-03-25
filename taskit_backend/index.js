const app = require('./app');
const db=require('./config/db');
const port=3000;
const UserModel=require('./model/user.model');
require('dotenv').config();

app.get('/',(req,res)=>{
    res.send("Hello world");
})
app.listen(port,()=>{
    console.log(`Server listening on port http://localhost:${port}`);
});