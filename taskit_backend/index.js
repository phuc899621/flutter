const app = require('./app');
const db=require('./config/db');
const port=8080;
const UserModel=require('./model/user.model')
require('dotenv').config();
const path = require('path');

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'hello.html'));
});
app.listen(port,()=>{
    console.log(`Server listening on port http://localhost:${port}`);
});