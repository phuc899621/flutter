const transporter = require("../config/email");

class EmailServices{
    static async sendEmail(to, subject, text) {
    try {
      const info = await transporter.sendMail({
        from: '"Admin" <Taskit2025@Authentication.com>',
        to,
        subject,
        text,
      });
      return { 
          success: true, 
          message: "Email sent successfully", 
          data:{}
      };
    } catch (e) {
      return { success: false, 
          message: "Failed to send email"+e.message, 
          data:{}
      };
    }
  }
}

module.exports = EmailServices;
