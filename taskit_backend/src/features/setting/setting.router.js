import express from 'express';
import * as SettingController from './setting.controller.js';
import { jwtMiddleware } from '../auth/jwt.middleware.js';
import * as SettingMiddleware from './setting.middleware.js';
const router = express.Router();

router.get('/', jwtMiddleware, SettingController.get_setting);
router.patch('/', jwtMiddleware, SettingMiddleware.update_setting, SettingController.update_setting);
router.delete('/', jwtMiddleware, SettingController.delete_setting);

export default router;