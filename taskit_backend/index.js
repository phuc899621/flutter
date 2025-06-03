import app from './app.js';
import db from './config/db.js';
import UserModel from './model/user.model.js';
import dotenv from 'dotenv';
dotenv.config();
import path from 'path';
const port=8080;

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'hello.html'));
});
app.listen(port,()=>{
    console.log(`Server listening on port http://localhost:${port}`);
});