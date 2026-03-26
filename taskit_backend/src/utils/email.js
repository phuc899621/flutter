import "dotenv/config";
import { BrevoClient } from "@getbrevo/brevo";
import { ServerError } from "./error.js";

const client = new BrevoClient({
  apiKey: process.env.BREVO_API_KEY,
});

const transporter = {
  sendMail: async (mailOptions) => {
    try {
      const emailData = {
        sender: {
          name:
            mailOptions.fromName ||
            process.env.TASKIT_SENDER_NAME ||
            "Taskit App",
          email:
            mailOptions.from ||
            process.env.TASKIT_SENDER_EMAIL ||
            "noreply@taskit.com",
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
