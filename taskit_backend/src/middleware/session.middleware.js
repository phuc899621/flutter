import { verifyAccessToken } from "../shared/services/token.service.js";
import { AuthenticationError } from "../shared/utils/error.js";

export const sessionMiddleware = async (req, res, next) => {
  const token = req.headers["authorization"]?.split(" ")[1];
  const sessionId = req.headers["x-session-id"];

  try {
    if (!token) {
      throw new AuthenticationError("Access denied. No authorization provided");
    }
    if (!sessionId) {
      throw new AuthenticationError("Access denied. No session id provided");
    }
    const decoded = verifyAccessToken(token);
    console.log(decoded);
    console.log(sessionId);
    req.user = decoded;
    req.sessionId = sessionId;
    console.log(req.user);
    next();
  } catch (err) {
    next(err);
  }
};
