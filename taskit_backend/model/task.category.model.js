const mongoose = require("mongoose");
const db = require("../config/db");
const { Schema } = mongoose;
const categorySchema = new Schema({
    name: {
        type: String,
        required: true,
        unique: true,
        trim: true,
    },
    userId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'user',
        required: true
    }
});

categorySchema.statics.addCategory = async function(userId,name) {
    const category = new this({ name,userId });
    return await category.save();
};

categorySchema.statics.deleteCategory = async function(id) {
    return await this.findByIdAndDelete(id);
};

categorySchema.statics.updateCategory = async function(id, name) {
    return await this.findByIdAndUpdate(id, { name }, { new: true });
};

categorySchema.statics.findAllCategories = async function(userId) {
    console.log(userId);
    return await this.find({userId});
};
categorySchema.statics.addDefaultCategories = async function(userId) {
    const defaultCategories = [
        { name: 'Work', userId },
        { name: 'Personal', userId },
        { name: 'Shopping', userId },
        { name: 'Health', userId },
        { name: 'Travel', userId },
    ];
    return await this.insertMany(defaultCategories);
}
categorySchema.statics.deleteAllCategories = async function(userId) {
    return await this.deleteMany({userId});
}

const Category = db.model("category", categorySchema);
module.exports = Category;