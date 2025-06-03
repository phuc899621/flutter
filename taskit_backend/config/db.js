import dotenv from 'dotenv';
dotenv.config();
import mongoose from 'mongoose';


const mongoURI=process.env.MONGODB_URI;
const connection = mongoose.createConnection(mongoURI,{
    ssl: true, // Bắt buộc dùng SSL cho MongoDB Atlas
}).on('open',()=>{
    console.log("MongoDB connected!");
}).on('error',(err)=>{
    console.log("MongoDB connected failed",err);
});
export default connection;
