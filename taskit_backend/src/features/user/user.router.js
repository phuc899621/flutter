import express from 'express';
import * as AuthController from '../auth/auth.controller.js';
import * as AuthMiddleware from '../auth/auth.middleware.js';
import * as UserMiddleware from '../user/user.middleware.js';
import {jwtMiddleware} from '../auth/jwt.middleware.js';    
import {upload} from '../upload/upload.middleware.js';
import * as UserController from '../user/user.controller.js';
import { multerErrorHandler } from '../upload/multer.middleware.js';

const router = express.Router();


router.get('/login/verify', AuthController.login_verify);

router.put('/',jwtMiddleware, upload.single('avatar'), UserController.update_profile,multerErrorHandler);
router.put('/email', jwtMiddleware,UserMiddleware.update_email, UserController.update_email);
router.put('/email/verify', jwtMiddleware,UserMiddleware.update_email_verify, UserController.update_email_verify);
router.put('/password', jwtMiddleware, UserMiddleware.update_password, UserController.update_password);
router.delete('/', jwtMiddleware, UserController.delete_account);

export default router;