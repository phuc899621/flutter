import SubtaskServices from "./subtask.services.js";

export const createSubtask = async (req, res, next) => {
  try {
    const { taskId } = req.params;
    const userId = req.user.userId;
    const sessionId = req.sessionId;
    const result = await SubtaskServices.createSubtask(
      userId,
      sessionId,
      taskId,
      req.body,
    );
    return res.status(201).json({
      message: "Subtask created successfully",
      data: result,
    });
  } catch (e) {
    next(e);
  }
};

export const updateSubtask = async (req, res, next) => {
  try {
    const { taskId, subtaskId } = req.params;
    const userId = req.user.userId;
    const sessionId = req.sessionId;
    const result = await SubtaskServices.updateSubtask(
      userId,
      sessionId,
      taskId,
      subtaskId,
      req.body,
    );
    return res.status(200).json({
      message: "Subtask updated successfully",
      data: result,
    });
  } catch (e) {
    next(e);
  }
};

export const deleteSubtask = async (req, res, next) => {
  try {
    const { taskId, subtaskId } = req.params;

    const result = await SubtaskServices.deleteSubtask(
      userId,
      sessionId,
      taskId,
      subtaskId,
    );
    return res.status(200).json({
      message: "Subtask deleted successfully",
      data: result,
    });
  } catch (e) {
    next(e);
  }
};
