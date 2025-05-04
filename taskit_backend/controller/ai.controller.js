const AIServices=require('../services/ai.services');
exports.suggestCategories=async (req,res)=>{
    try{
        const {title}=req.body;
        if(title){
            const category=await AIServices.suggestCategories(
                title
            );
            return res.status(200).json({
                message: "Suggest category successfully",
                data:category
        });
    }
    }catch(e){
        const statusCode = e.statusCode || 500;
        return res.status(statusCode).json({
            message: "An error occurred when suggest category: "+e.message,
            data:{}
        });
    }
}
