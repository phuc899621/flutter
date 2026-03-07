import express from 'express';
import * as AuthController from '../controller/auth.controller.js';
import * as AuthMiddleware from '../middleware/auth.middleware.js';
import * as UserMiddleware from '../middleware/user.middleware.js';
import {jwtMiddleware} from '../middleware/jwt.middleware.js';    
import {upload} from '../middleware/upload.middleware.js';
import * as UserController from '../controller/user.controller.js';
import { multerErrorHandler } from '../middleware/multer.middleware.js';

const router = express.Router();


router.get('/login/verify', AuthController.login_verify);

router.put('/',jwtMiddleware, upload.single('avatar'), UserController.update_profile,multerErrorHandler);
router.put('/email', jwtMiddleware,UserMiddleware.update_email, UserController.update_email);
router.put('/email/verify', jwtMiddleware,UserMiddleware.update_email_verify, UserController.update_email_verify);
router.put('/password', jwtMiddleware, UserMiddleware.update_password, UserController.update_password);
router.delete('/', jwtMiddleware, UserController.delete_account);

export default router;