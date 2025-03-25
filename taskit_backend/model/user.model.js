const mongoose=require('mongoose');
const db=require('../config/db');
const bcrypt=require('bcrypt');
const { Schema }=mongoose;

const userScheme=new Schema({
    email:{
        type: String,
        required: true,
        unique: true
    },
    name:{
        type: String,
        required: true
    },
    password:{
        type: String,
        required: true
    },
    avatar: {
        type: String,
        default: 'uploads/default.jpg'
    }
});

userScheme.pre('save',async function(){
    try{
        var user=this;
        const salt=await(brypt.genSalt(10));
        const hashPass=await brypt.hash(user.password,salt);

        user.password=hashPass;
    }catch(e){
        throw(e);
    }
})

const UserModel=db.model('user',userScheme);
module.exports=UserModel;
