import express from 'express';
import bodyParser from 'body-parser';
import swaggerUI from 'swagger-ui-express';
import swaggerSpec from './src/config/swagger.js';
import errorHandler from './src/middleware/errorHandler.js';
import apiV1 from './src/api/v1/index.js';
const app=express();
app.use(bodyParser.json());
app.use('/docs',swaggerUI.serve, swaggerUI.setup(swaggerSpec));
app.use('/api/v1',apiV1)
app.use(errorHandler)
export default app;