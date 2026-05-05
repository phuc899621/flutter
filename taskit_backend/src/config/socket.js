import { Server } from "socket.io";
import { socketAuth } from "../middleware/socket.middleware.js";
import logger from "../shared/utils/logger.js";
import { AuthenticationError } from "../shared/utils/error.js";
let io;
export const initSocket = (server) => {
  const v1Path = "/api/v1/socket";
  io = new Server(server, {
    path: v1Path,
    cors: {
      origin: "*",
    },
  });
  io.use(socketAuth);
  io.on("connection", (socket) => {
    const userId = socket.user.userId;
    const sessionId = socket.sessionId;
    logger.info(`User ${userId} connected with session ${sessionId}`);
    logger.info(`User ${userId} connected`);
    socket.join(userId);
    socket.join(sessionId);
    socket.on("disconnect", () => {
      console.log(`User ${userId} disconnected`);
    });
  });
  io.on("disconnect", (socket) => {
    const userId = socket.user.userId;
    logger.info(`User ${userId} disconnected`);
    if (socket.tokenExpirationTimer) clearTimeout(socket.tokenExpirationTimer);
  });
  return io;
};

export const getIO = () => {
  if (!io) throw new AuthenticationError("Socket not initialized");
  return io;
};
