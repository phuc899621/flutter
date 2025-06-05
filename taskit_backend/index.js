import app from './app.js';
import db from './config/db.js';
import UserModel from './models/user.model.js';
import dotenv from 'dotenv';
dotenv.config();
const port=8080;
app.listen(port,()=>{
    console.log(`Server listening on port http://localhost:${port}`);
});