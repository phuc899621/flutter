
import swaggerJSDoc from 'swagger-jsdoc';
import path from 'path';
import { fileURLToPath } from 'url';
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const options = {
  definition: {
    openapi: '3.0.4',
    info: {
      title: 'Taskit API',
      version: '1.0.0',
      description: 'API documentation for Taskit App using Swagger',
      contact :{
        name: "Nguyễn Hoàng Phúc",
        email: "phuc899621@gmailcom",
        url: "https://github.com/phuc899621/flutter/tree/main/taskit_backend"
      }
    },
    servers: [
      {
        url: 'http://localhost:8080', 
        description: 'Local server',
      },
      {
        url: 'None', 
        description: 'Production server',
      },
    ],
    components: {
      securitySchemes: {
        bearerAuth: {      // đây là tên scheme
          type: 'http',
          scheme: 'bearer',
          bearerFormat: 'JWT'
        }
      }
    },
  },
  apis: [
    path.join(__dirname, '../routers/*.js'),
    path.join(__dirname,'./swagger.schemas.js')
  ], 
};
export default swaggerJSDoc(options);
