import UserDeviceModel from "./user-device.model.js";

export default class UserDeviceService {
  static async registerDevice({ userId, deviceId, fcmToken, platform }) {
    try {
      console.log("[UserDeviceService] registerDevice params: ", {
        userId,
        deviceId,
        fcmToken,
        platform,
      });
      const device = await UserDeviceModel.findOneAndUpdate(
        { userId, deviceId },
        { $set: { fcmToken, platform, lastSeen: Date.now() } },
        { upsert: true, new: true, setDefaultsOnInsert: true },
      );
      return device.toObject();
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Register device ServerError: ${e.message}`);
    }
  }

  static async updateFcmToken({ userId, deviceId, fcmToken, platform }) {
    try {
      console.log("[UserDeviceService] updateFcmToken params: ", {
        userId,
        deviceId,
        fcmToken,
        platform,
      });
      const device = await UserDeviceModel.findOneAndUpdate(
        { userId, deviceId },
        { $set: { fcmToken, lastSeen: Date.now(), platform } },
        { upsert: true, new: true, setDefaultsOnInsert: true },
      );
      return device.toObject();
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Update fcmToken ServerError: ${e.message}`);
    }
  }

  static async removeDevice({ userId, deviceId }) {
    try {
      console.log("[UserDeviceService] removeDevice params: ", {
        userId,
        deviceId,
      });
      const device = await UserDeviceModel.findOneAndDelete({
        userId,
        deviceId,
      });
      return device.toObject();
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Remove device ServerError: ${e.message}`);
    }
  }

  static async getFcmTokensByUserId({ userId }) {
    try {
      console.log("[UserDeviceService] getDevicesByUserId params: ", {
        userId,
      });
      const devices = await UserDeviceModel.find(
        { userId },
        { fcmToken: 1, _id: 0 },
      );
      return devices
        .map((device) => device.fcmToken)
        .filter((token) => token != null);
    } catch (e) {
      if (e instanceof BaseError) throw e;
      throw new ServerError(`Get devices by user id ServerError: ${e.message}`);
    }
  }
}
