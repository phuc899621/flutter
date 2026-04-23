import { OAuth2Client } from "google-auth-library";
import { GOOGLE_CONFIG } from "../../config/google.config.js";
import { AuthenticationError, ServerError } from "../utils/error.js";
import logger from "../utils/logger.js";
const client = new OAuth2Client([GOOGLE_CONFIG.clientID]);
class GoogleService {
  static async verifyGoogleToken(token) {
    try {
      const ticket = await client.verifyIdToken({
        idToken: token,
        audience: GOOGLE_CONFIG.serverId,
      });
      const payload = ticket.getPayload();
      logger.info(`Verify google token for ${payload?.email}`, payload);
      if (!payload) throw new AuthenticationError("Invalid token");
      return payload;
    } catch (e) {
      throw new ServerError(`Google token verification error: ${e.message}`);
    }
  }
}
export default GoogleService;
