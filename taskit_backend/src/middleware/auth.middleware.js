import "dotenv/config";
import { AuthorizationError } from "../utils/error.js";
import { verifyAccessToken } from "../utils/token.js";

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
    return res.status(401).json({
      message: "Invalid token with error" + err.message,
      data: {},
    });
  }
};
