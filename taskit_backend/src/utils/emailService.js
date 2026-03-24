import transporter from "./email.js";
import { BaseError, ServerError } from "./error.js";

class EmailServices {
  static async sendEmail(to, subject, text) {
    const mailOptions = {
      from: "phuc899621@gmail.com",
      to: to,
      subject: subject,
      text: text,
    };
    try {
      await transporter.sendMail(mailOptions);
      return {
        message: "Email sent successfully",
        data: {},
      };
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Send email error`, e.message);
    }
  }
}

export default EmailServices;
