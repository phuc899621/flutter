import logger from "../utils/logger.js";

const errorHandler = (err, req, res, next) => {
  const statusCode = err.statusCode || 500;
  const message = err.message || "Internal Server Error";
  const type = err.type || "ServerError";
  logger.error(message + "\n", { stack: err.stack });
  return res.status(statusCode).json({
    success: false,
    error: {
      message,
      type,
      stack: process.env.NODE_ENV === "development" ? err.stack : null,
    },
  });
};

export default errorHandler;
