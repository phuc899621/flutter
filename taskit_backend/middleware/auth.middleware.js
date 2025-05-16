const jwt = require('jsonwebtoken');
require('dotenv').config();

const authMiddleware = (req, res, next) => {
  const token = req.headers['authorization']?.split(' ')[1]; // "Bearer <token>"

  if (!token) {
    return res.status(404).json({ 
        message: 'Access denied. No authorization provided.' ,
        data:{}
    });
  }

  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    req.user = decoded;
    next();
  } catch (err) {
    return res.status(401).json({ 
        message: 'Invalid token.'+err.message,
        data:{}
    });
  }
};

module.exports = authMiddleware;
