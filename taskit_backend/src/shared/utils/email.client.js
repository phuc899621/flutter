import { BrevoClient } from "@getbrevo/brevo";
import { ServerError } from "../utils/error.js";
import { EMAIL_CONFIG } from "../../config/email.config.js";

const client = new BrevoClient({
  apiKey: EMAIL_CONFIG.brevoApiKey,
});

const transporter = {
  sendMail: async (mailOptions) => {
    try {
      const emailData = {
        sender: {
          name: mailOptions.fromName || EMAIL_CONFIG.defaultSender.name,
          email: mailOptions.from || EMAIL_CONFIG.defaultSender.email,
        },
        to: [
          {
            email: mailOptions.to,
            name: mailOptions.toName || "User",
          },
        ],
        subject: mailOptions.subject || "Taskit - Account Activation",
        textContent: mailOptions.text || "No text content.",
        htmlContent:
          mailOptions.html ||
          `
          <h3>${mailOptions.text || "0000"}</h3>
          <p>If this is not your request, ignore it.</p>
          <hr/>
          <small>Email was sent from Taskit</small>
          `,
        tags: mailOptions.customId
          ? [mailOptions.customId]
          : ["Taskit-Activation"], // CustomID
      };

      const result =
        await client.transactionalEmails.sendTransacEmail(emailData);

      return result;
    } catch (e) {
      throw new ServerError(`Send email error: ${e.message}`);
    }
  },
};

export default transporter;
