import transporter from "../utils/email.client.js";
import { BaseError, ServerError } from "../utils/error.js";

class EmailServices {
  static async sendEmail(to, subject, text, html, from, fromName, customId) {
    const mailOptions = {
      to,
      subject,
      text,
      html,
      customId: customId || "Taskit-Activation",
    };

    try {
      const result = await transporter.sendMail(mailOptions);
      return {
        message: "Email sent successfully",
        data: result,
      };
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Send email error ${e.message}`);
    }
  }
}

export default EmailServices;
