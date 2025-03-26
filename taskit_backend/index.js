const app = require('./app');
const db=require('./config/db');
const port=8080;
const UserModel=require('./model/user.model')
require('dotenv').config();

app.get('/',(req,res)=>{
    res.send("Hello   dsdasdsadadadada world");
})
app.listen(port,()=>{
    console.log(`Server listening on port http://localhost:${port}`);
});