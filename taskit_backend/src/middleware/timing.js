import { performance } from "perf_hooks";
import logger from "../utils/logger.js";
import requestId from "./requestId.js";

const timingMiddleware = (req, res, next) => {
  const start = performance.now();

  res.on("finish", () => {
    const duration = (performance.now() - start).toFixed(2);

    const logData = {
      requestId: req.requestId,
      method: req.method,
      url: req.originalUrl,
      status: res.statusCode,
      time: `${duration} ms`,
      ip: req.ip,
    };
    if (res.statusCode >= 500) {
      logger.error("API Error", logData);
    } else if (res.statusCode >= 400) {
      logger.warn("API Warning", logData);
    } else {
      logger.info("API Request", logData);
    }
  });

  next();
};

export default timingMiddleware;
