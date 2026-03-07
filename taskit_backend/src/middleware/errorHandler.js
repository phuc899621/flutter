const errorHandler = (err, req, res, next) => {

  const statusCode = err.statusCode || 500;
  const message = err.message || "Internal Server Error";
  const type = err.type || "InternalError";
  const detail = err.detail || null;
  res.status(statusCode).json({
    success: false,
    error: {
      statusCode,
      message,
      type,
      detail,
      stack: process.env.NODE_ENV === "development" ? err.stack : null
    }
  });

};

export default errorHandler;