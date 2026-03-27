import "dotenv/config";

export const MONGO_CONFIG = {
  uri: process.env.MONGODB_URI,
  options: {
    ssl: true,
  },
  messages: {
    connected: "MongoDB connected!",
    failed: "MongoDB connection failed",
  },
};
