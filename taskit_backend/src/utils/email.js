import 'dotenv/config';
import mailjet from 'node-mailjet';

const client = mailjet.apiConnect(
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
                Email: mailOptions.from || 'noreply@taskit.com',
                Name: mailOptions.fromName || 'Taskit',
              },
              To: [
                {
                  Email: mailOptions.to,
                  Name: mailOptions.toName || 'User',
                },
              ],
              Subject: mailOptions.subject || 'Taskit - Verify',
              TextPart: mailOptions.text || 'No text content.',
              HTMLPart: mailOptions.html || `
                <h3>${mailOptions.text || '0000'}</strong></h3>
                <p>If this is not your request, ignore it.</p>
                <hr/>
                <small>Email was sent from taskit</small>
              `,
              CustomID: mailOptions.customId || 'TaskitEmail',
            },
          ],
        });

      const result = await request;
      return result.body;
    } catch (error) {
      console.error('Error sending email:', error.statusCode, error.response?.body || error.message);
      throw error; 
    }
  },
};

export default transporter;
