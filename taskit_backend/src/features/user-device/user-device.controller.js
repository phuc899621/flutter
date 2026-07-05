import UserDeviceService from "./user-device.service.js";

export const registerDevice = async (req, res, next) => {
  try {
    console.log("[UserDeviceController] registerDevice");
    const { fcmToken, platform, deviceId } = req.body;
    const userId = req.user.userId;
    const result = await UserDeviceService.registerDevice({
      userId,
      fcmToken,
      platform,
      deviceId,
    });
    return res.status(201).json({
      message: "Register device successfully",
      data: result,
    });
  } catch (e) {
    next(e);
  }
};

export const updateFcmToken = async (req, res, next) => {
  try {
    console.log("[UserDeviceController] updateFcmToken");
    const { fcmToken, deviceId, platform } = req.body;
    const userId = req.user.userId;
    const result = await UserDeviceService.updateFcmToken({
      userId,
      fcmToken,
      platform,
      deviceId,
    });
    return res.status(201).json({
      message: "Update fcmToken successfully",
      data: result,
    });
  } catch (e) {
    next(e);
  }
};

export const removeDevice = async (req, res, next) => {
  try {
    console.log("[UserDeviceController] Remove device");
    const { deviceId } = req.body;
    const userId = req.user.userId;
    await UserDeviceService.removeDevice({
      userId,
      deviceId,
    });
    return res.status(200).json({
      message: "Delete user device successfully",
    });
  } catch (e) {
    next(e);
  }
};
