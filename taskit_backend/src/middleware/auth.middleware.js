import { verifyAccessToken } from "../shared/services/token.service.js";
import { AuthenticationError } from "../shared/utils/error.js";

export const authMiddleware = async (req, res, next) => {
  const token = req.headers["authorization"]?.split(" ")[1];

  try {
    if (!token) {
      throw new AuthenticationError("Access denied. No authorization provided");
    }
    const decoded = verifyAccessToken(token);
    console.log(decoded);
    req.user = decoded;
    next();
  } catch (err) {
    next(err);
  }
};
