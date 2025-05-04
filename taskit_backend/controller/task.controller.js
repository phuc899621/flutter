const TaskServices=require('../services/task.services');
   exports.createTask=async (req,res)=>{
        try{
            const {title,description,dueDate,priority,category,subtasks}=req.body;
            const userId=req.user.id;
            if(!userId||!title||!dueDate||!priority||!category){
                return res.status(400).json({
                    message: "Please enter all fields",
                    data:{}
                });
            }
            await TaskServices.createTask(
                userId,title,description,dueDate,priority,category,subtasks
            );
            return res.status(201).json({
                message: "Create task successfully",
                data:{}
            });
        }catch(e){
            const statusCode = e.statusCode || 500;
            return res.status(statusCode).json({
                message: "An error occurred when create task: "+e.message,
                data:{}
            });
        }
    }
    exports.addListSubtask=async (req,res)=>{
        try{
            const {subtasks}=req.body;
            const taskId=req.params.taskId;
            if(!taskId||!subtasks){
                return res.status(400).json({
                    message: "Please enter all fields",
                    data:{}
                });
            }
    
            await TaskServices.addListSubtask(
                taskId,subtasks
            );
            return res.status(201).json({
                message: "Add list subtask successfully",
                data:{}
            });
        }catch(e){
            const statusCode = e.statusCode || 500;
            return res.status(statusCode).json({
                message: "An error occurred when add list subtask: "+e.message,
                data:{}
            });
        }
    }
    exports.updateSubtask=async (req,res)=>{
        try{
            const {subtask}=req.body;
            const {taskId,subtaskId}=req.params;
            if(!taskId||!subtaskId||!subtask){
                return res.status(400).json({
                    message: "Please enter all fields",
                    data:{}
                });
            }
            await TaskServices.updateSubtask(
                taskId,subtaskId,subtask
            );
            return res.status(201).json({
                message: "Update subtask successfully",
                data:{}
            });
        }catch(e){
            const statusCode = e.statusCode || 500;
            return res.status(statusCode).json({
                message: "An error occurred when update subtask: "+e.message,
                data:{}
            });
        }
    }
    exports.updateTask=async (req,res)=>{
        try{
            const {updateData}=req.body;
            const taskId=req.params.taskId;
            if(!taskId||!updateData){
                return res.status(400).json({
                    message: "Please enter all fields",
                    data:{}
                });
            }
    
            await TaskServices.updateTask(
                taskId,updateData
            );
            return res.status(201).json({
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
    exports.updateListSubtask=async (req,res)=>{
        try{
            const {subtasks}=req.body;
            const taskId=req.params.taskId;
            if(!taskId||!subtasks){
                return res.status(400).json({
                    message: "Please enter all fields",
                    data:{}
                });
            }

            await TaskServices.updateListSubtask(
                taskId,subtasks
            );
            return res.status(201).json({
                message: "Update list subtask successfully",
                data:{}
            });
        }catch(e){
            const statusCode = e.statusCode || 500;
            return res.status(statusCode).json({
                message: "An error occurred when update list subtask: "+e.message,
                data:{}
            });
        }
    }
    exports.deleteTask=async (req,res)=>{
        try{
            const taskId=req.params.taskId;
            if(!taskId){
                return res.status(400).json({
                    message: "Please enter all fields",
                    data:{}
                });
            }
    
            await TaskServices.deleteTask(
                taskId
            );
            return res.status(201).json({
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
    exports.deleteSubtask=async (req,res)=>{
        try{
            const {subtaskId}=req.body;
            const taskId=req.params.taskId;
            if(!taskId||!subtaskId){
                return res.status(400).json({
                    message: "Please enter all fields",
                    data:{}
                });
            }
    
            await TaskServices.deleteSubtask(
                taskId,subtaskId
            );
            return res.status(201).json({
                message: "Delete subtask successfully",
                data:{}
            });
        }catch(e){
            const statusCode = e.statusCode || 500;
            return res.status(statusCode).json({
                message: "An error occurred when delete subtask: "+e.message,
                data:{}
            });
        }
    }
    exports.findAllTaskByUserId=async (req,res)=>{
        try{
            const userId=req.user.id;
            if(!userId){
                return res.status(400).json({
                    message: "Please enter all fields",
                    data:{}
                });
            }
            const {status, dueDate}=req.query;
            const tasks=await TaskServices.findAllTaskByUserId(
                userId,{status,dueDate}
            );
            return res.status(201).json({
                message: "Find all task successfully",
                data:{
                    tasks:tasks
                }
            });
        }catch(e){
            const statusCode = e.statusCode || 500;
            return res.status(statusCode).json({
                message: "An error occurred when find all task: "+e.message,
                data:{}
            });
        }
    }
    exports.findAllSubTaskByUserId=async (req,res)=>{
        try{
            const taskId=req.params.taskId;
            if(!taskId){
                return res.status(400).json({
                    message: "Please enter all fields",
                    data:{}
                });
            }
    
            const subtasks=await TaskServices.findAllSubTask(
                taskId
            );
            return res.status(201).json({
                message: "Find all subtask successfully",
                data:{
                    subtasks:subtasks
                }
            });
        }catch(e){
            const statusCode = e.statusCode || 500;
            return res.status(statusCode).json({
                message: "An error occurred when find all subtask: "+e.message,
                data:{}
            });
        }

    }
    exports.findTaskById=async (req,res)=>{
        try{
            const taskId=req.params.taskId;
            if(!taskId){
                return res.status(400).json({
                    message: "Please enter all fields",
                    data:{}
                });
            }
    
            const task=await TaskServices.findTaskById(
                taskId
            );
            return res.status(201).json({
                message: "Find task successfully",
                data:{
                    task:task
                }
            });
        }catch(e){
            const statusCode = e.statusCode || 500;
            return res.status(statusCode).json({
                message: "An error occurred when find task: "+e.message,
                data:{}
            });
        }
    }