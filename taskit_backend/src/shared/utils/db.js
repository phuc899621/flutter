import mongoose from "mongoose";
import { MONGO_CONFIG } from "../../config/db.config.js";
import logger from "./logger.js";
console.log(MONGO_CONFIG.uri);
const connection = mongoose
  .createConnection(MONGO_CONFIG.uri, MONGO_CONFIG.options)
  .on("open", () => {
    logger.info(MONGO_CONFIG.messages.connected);
  })
  .on("error", (err) => {
    logger.error(MONGO_CONFIG.messages.failed, err);
  });
export default connection;
