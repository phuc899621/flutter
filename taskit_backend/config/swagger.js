// config/swagger.js
const swaggerJSDoc = require('swagger-jsdoc');

const options = {
  definition: {
    openapi: '3.0.0',
    info: {
      title: 'My API',
      version: '1.0.0',
      description: 'API documentation using Swagger',
    },
    servers: [
      {
        url: 'http://localhost:3000', // Thay đổi tùy theo local hoặc production
      },
    ],
  },
  apis: ['./routes/*.js'], // Chỉ đến nơi bạn viết doc dạng comment
};
const swaggerSpec = swaggerJSDoc(options);
module.exports = swaggerSpec;
