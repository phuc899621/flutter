import transporter from "../config/email.js";

class EmailServices {
    static async sendEmail(to, subject, text) {
        const mailOptions = {
            from: "phuc899621@gmail.com",
            to: to,
            subject: subject,
            text: text
        };
        try {
            await transporter.sendMail(mailOptions);
            return {
                status: true,
                message: "Email sent successfully",
                data: {}
            };
        } catch (e) {
            return {
                status: false,
                message: "Failed to send email: " + e.message,
                data: {}
            };
        }
    }
}

export default EmailServices;
