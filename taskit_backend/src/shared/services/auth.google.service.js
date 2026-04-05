import { OAuth2Client } from "google-auth-library";
import { GOOGLE_CONFIG } from "../../config/google.config.js";
import { AuthenticationError, ServerError } from "../utils/error.js";
import logger from "../utils/logger.js";
const client = new OAuth2Client([GOOGLE_CONFIG.clientID]);

export const verifyGoogleToken = async (token) => {
  try {
    const ticket = await client.verifyIdToken({
      idToken: token,
      audience: GOOGLE_CONFIG.clientID,
    });
    const payload = ticket.getPayload();
    logger.info(`Verify google token for ${payload?.email}`, payload);
    if (!payload) throw new AuthenticationError("Invalid token");
    return payload;
  } catch (e) {
    throw new ServerError(`Google token verification error: ${e.message}`);
  }
};
