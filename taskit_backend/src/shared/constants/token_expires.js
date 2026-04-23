import "dotenv/config";
export const TOKEN_EXPIRES = {
  ACCESS: process.env.ACCESS_TOKEN_EXP || "15m",
  REFRESH: process.env.REFRESH_TOKEN_EXP || "7d",
};
