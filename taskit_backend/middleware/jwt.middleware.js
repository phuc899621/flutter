import pkg from 'jsonwebtoken';
const { verify } = pkg;
import 'dotenv/config';

export function jwtMiddleware(req, res, next) {
  const token = req.headers['authorization']?.split(' ')[1]; // "Bearer <token>"

  if (!token) {
    return res.status(404).json({ 
        message: 'Access denied. No authorization provided.' ,
        data:{}
    });
  }

  try {
    const decoded = verify(token, process.env.JWT_SECRET);
    req.user = decoded;
    next();
  } catch (err) {
    return res.status(401).json({ 
        message: 'Invalid token with error'+err.message,
        data:{}
    });
  }
}
