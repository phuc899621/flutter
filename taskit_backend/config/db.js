require('dotenv').config();
const mongoose = require('mongoose');
const mongoURI=process.env.MONGODB_URI;
const connection = mongoose.createConnection(mongoURI,{
    ssl: true, // Bắt buộc dùng SSL cho MongoDB Atlas
}).on('open',()=>{
    console.log("MongoDB connected!");
}).on('error',(err)=>{
    console.log("MongoDB connected failed",err);
});
module.exports=connection;
