const TaskServices=require('../services/task.services');
const SubtaskServices=require('../services/subtask.services');
   exports.addTaskWithSubtasks=async (req,res)=>{
        try{
            const {title,description,dueDate,priority,category,subtasks,localId}=req.body;
            const userId=req.user.id;
            if(!userId||!title||!dueDate||!priority||!category){
                return res.status(400).json({
                    message: "Please enter all fields",
                    data:{}
                });
            }
            const taskResult= await TaskServices.addTask(
                userId,title,description,dueDate,priority,category,localId
            );
            let subtaskResult=[];
            if(subtasks!=[]&&subtasks){
                subtaskResult =await SubtaskServices.addListSubtask(
                    taskResult.remoteId,subtasks
                );
            }
            return res.status(201).json({
                message: "Create task successfully",
                data:{
                    task: taskResult,
                    subtasks: subtaskResult
                }
            });
        }catch(e){
            const statusCode = e.statusCode || 500;
            return res.status(statusCode).json({
                message: "An error occurred when create task: "+e.message,
                data:{}
            });
        }
    }
    exports.updateTask=async (req,res)=>{
        try{
            const {taskId}=req.query;
            if(!taskId){
                return res.status(400).json({
                    message: "Please give task id",
                    data:{}
                });
            }
            const result=await TaskServices.updateTask(
                taskId,req.body
            );
            return res.status(200).json({
                message: "Update task successfully",
                data:{}
            });
        }catch(e){
            const statusCode = e.statusCode || 500;
            return res.status(statusCode).json({
                message: "An error occurred when update task: "+e.message,
                data:{}
            });
        }
    }
    exports.deleteTask=async (req,res)=>{
        try{
            const {taskId}=req.query;
            if(!taskId){
                return res.status(400).json({
                    message: "Please give task id",
                    data:{}
                });
            }
            const result=await TaskServices.deleteTask(taskId);
            return res.status(200).json({
                message: "Delete task successfully",
                data:{}
            });
        }catch(e){
            const statusCode = e.statusCode || 500;
            return res.status(statusCode).json({
                message: "An error occurred when delete task: "+e.message,
                data:{}
            });
        }
    }
    exports.deleteAllTasks=async (req,res)=>{
        try{
            const userId=req.user.id;
            if(!userId){
                return res.status(400).json({
                    message: "Please give user id",
                    data:{}
                });
            }
            const result=await TaskServices.deleteAllTask(userId);
            return res.status(200).json({
                message: "Delete all task successfully",
                data:{}
            });
        }catch(e){
            const statusCode = e.statusCode || 500;
            return res.status(statusCode).json({
                message: "An error occurred when delete all task: "+e.message,
                data:{}
            });
        }
    }
    exports.deleteListTasks=async (req,res)=>{
        try{
            const {taskIds}=req.body;
            if(!taskIds){
                return res.status(400).json({
                    message: "Please give task ids",
                    data:{}
                });
            }
            await TaskServices.deleteListTask(taskIds);
            return res.status(200).json({
                message: "Delete list task successfully",
                data:{}
            });
        }catch(e){
            const statusCode = e.statusCode || 500;
            return res.status(statusCode).json({
                message: "An error occurred when delete list task: "+e.message,
                data:{}
            });
        }
    }
    exports.findAllTasks=async (req,res)=>{
        try{
            const userId=req.user.id;
            const query=req.query;
            if(!userId){
                return res.status(400).json({
                    message: "Please give user id",
                    data:{}
                });
            }
            const result=await TaskServices.findAllTasks(userId,query);
            return res.status(200).json({
                message: "Get all tasks successfully",
                data:result
            });
        }catch(e){
            const statusCode = e.statusCode || 500;
            return res.status(statusCode).json({
                message: "An error occurred when get all tasks: "+e.message,
                data:{}
            });
        }
    }

