import winston from "winston";
import path from "path";

// Hàm map màu sang ANSI code
function colorCode(color) {
  switch (color) {
    case "red":
      return "31";
    case "green":
      return "32";
    case "yellow":
      return "33";
    case "blue":
      return "34";
    case "magenta":
      return "35";
    case "cyan":
      return "36";
    case "white":
      return "37";
    default:
      return "37";
  }
}

const messageColorize = winston.format((info) => {
  let msgColor;
  switch (info.level) {
    case "error":
      msgColor = "red";
      break;
    case "warn":
      msgColor = "yellow";
      break;
    case "info":
      msgColor = "green";
      break;
    default:
      msgColor = "white";
      break;
  }
  info.message = `\x1b[1;${colorCode(msgColor)}m${info.message}\x1b[0m`;
  return info;
})();

const logFormat = winston.format.combine(
  messageColorize,
  winston.format.colorize(),
  winston.format.timestamp({ format: "YYYY-MM-DD HH:mm:ss" }),
  winston.format.printf(({ timestamp, level, message, stack, ...meta }) => {
    const metaStr = Object.keys(meta).length
      ? JSON.stringify(meta, null, 2)
      : "";
    const stackStr = stack ? `\n${stack}` : "";
    return `${timestamp} [${level}]: ${message}${stackStr} ${metaStr}`;
  }),
);

const logger = winston.createLogger({
  level: "info",
  format: logFormat,
  transports: [
    new winston.transports.Console(),
    new winston.transports.File({
      filename: path.join("logs", "error.log"),
      level: "error",
    }),
    new winston.transports.File({
      filename: path.join("logs", "combined.log"),
    }),
  ],
  exitOnError: false,
});

export default logger;
