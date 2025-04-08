const transporter = require("../config/email");

class EmailServices{
    static async sendEmail(to, subject, text) {
      const mailOptions={
          from: "phuc899621@gmail.com",
          to: to,
          subject: subject,
          text: text
     }
      transporter.sendMail(mailOptions).then(response => {
        return { 
          status: true,
          message: "Email sent successfully", 
          data:{}
        };
      }).catch(error => {
        return {
          status: false, 
          message: "Failed to send email"+e.message, 
          data:{}
        }
      });
      
  }
}


module.exports = EmailServices;
