const app = require('./app');
const db=require('./config/db');
const port=8080;
const UserModel=require('./model/user.model')
require('dotenv').config();

app.get('/', (req, res) => {
    res.send('<h1 style="color: blue; font-family: Arial;">Hello Longs from Express!</h1>');
});
app.listen(port,()=>{
    console.log(`Server listening on port http://localhost:${port}`);
});