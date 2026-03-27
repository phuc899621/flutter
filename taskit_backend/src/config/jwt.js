import "dotenv/config";
export const JWT_CONFIG = {
  ACCESS: {
    secret: process.env.JWT_ACCESS_SECRET,
    exp: process.env.ACCESS_TOKEN_EXP,
  },
  REFRESH: {
    secret: process.env.JWT_REFRESH_SECRET,
    exp: process.env.REFRESH_TOKEN_EXP,
  },
  FORGOT_PASSWORD: {
    secret: process.env.JWT_FORGOT_PASSWORD_SECRET,
    exp: process.env.FORGOT_PASSWORD_TOKEN_EXP,
  },
};
