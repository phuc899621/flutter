import "dotenv/config";

export const EMAIL_CONFIG = {
  brevoApiKey: process.env.BREVO_API_KEY,
  defaultSender: {
    name: process.env.TASKIT_SENDER_NAME || "Taskit App",
    email: process.env.TASKIT_SENDER_EMAIL || "phuc899621@gmailcom",
  },
  defaultTag: "Taskit-Activation",
};
