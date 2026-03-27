import logger from "../shared/utils/logger.js";

const errorHandler = (err, req, res, next) => {
  const statusCode = err.statusCode || 500;
  const message = err.message || "Internal Server Error";
  logger.error("Error", {
    requestId: req.requestId,
    method: req.method,
    url: req.originalUrl,
    status: statusCode,
    message: err.message,
    stack: err.stack,
  });
  return res.status(statusCode).json({
    success: false,
    message,
  });
};

export default errorHandler;
