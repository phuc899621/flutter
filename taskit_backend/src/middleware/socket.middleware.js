import { verifyAccessToken } from "../shared/services/token.service.js";
import { AuthenticationError } from "../shared/utils/error.js";
import logger from "../shared/utils/logger.js";

export const socketAuth = (socket, next) => {
  const accessToken =
    socket.handshake.auth?.token ||
    socket.handshake.headers.authorization?.replace("Bearer ", "");
  const sessionId = socket.handshake.auth?.sessionId;
  console.log(socket);
  if (!accessToken || !sessionId)
    return next(
      new AuthenticationError("Access denied. No authorization provided"),
    );
  try {
    const payload = verifyAccessToken(accessToken);
    socket.user = payload;
    socket.sessionId = sessionId;
    const expiresAt = payload.exp;
    const remainingTime = expiresAt * 1000 - Date.now();
    socket.tokenExpirationTimer = setTimeout(() => {
      console.log(
        `Disconnecting user due to token expiration ${payload.userId}`,
      );
      socket.disconnect(true);
    }, remainingTime);
    next();
  } catch (err) {
    logger.error(err);
    next(new Error("UNAUTHORIZED"));
  }
};
