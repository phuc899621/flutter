import jwt from "jsonwebtoken";
export const signToken = (payload, config) => {
  return jwt.sign(payload, config.secret, {
    expiresIn: config.exp,
  });
};

export const verifyToken = (token, config) => {
  return jwt.verify(token, config.secret);
};
