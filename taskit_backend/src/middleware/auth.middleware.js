import { AuthorizationError } from "../shared/utils/error.js";
import { verifyAccessToken } from "../shared/services/token.service.js";

export const authMiddleware = async (req, res, next) => {
  const token = req.headers["authorization"]?.split(" ")[1];
  if (!token) {
    throw new AuthorizationError("Access denied. No authorization provided");
  }

  try {
    const decoded = verifyAccessToken(token);
    req.user = decoded;
    next();
  } catch (err) {
    throw new AuthorizationError("Invalid token");
  }
};
