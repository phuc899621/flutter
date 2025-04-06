require('dotenv').config();
const mailjet=require('node-mailjet')

const client=mailjet.apiConnect(
  process.env.MAILJET_API_KEY,
  process.env.MAILJET_SECRET_KEY
);
const transporter = {
  sendMail: async (mailOptions) => {
    try {
      const request = client
        .post('send', { version: 'v3.1' })
        .request({
          Messages: [
            {
              From: {
                Email: mailOptions.from, 
                Name: mailOptions.fromName || 'Taskit', 
              },
              To: [
                {
                  Email: mailOptions.to,
                  Name: mailOptions.toName || 'User',  
                },
              ],
              Subject: mailOptions.subject,  
              TextPart: mailOptions.text,  
            },
          ],
        });

      const result = await request;
      return result.body;
    } catch (error) {
      console.error('Error sending email:', error);
    }
  },
};

module.exports = transporter;
