import { ServerError } from "../utils/error.js";
import fs from "fs";
import path from "path";
import { v4 as uuidv4 } from "uuid";
import axios from "axios";

const UPLOAD_DIR = path.join(process.cwd(), "uploads");
if (!fs.existsSync(UPLOAD_DIR)) {
  fs.mkdirSync(UPLOAD_DIR, { recursive: true });
}
export default class ImageService {
  static async uploadFromUrl(imageUrl) {
    try {
      const response = await axios({
        url: imageUrl,
        method: "GET",
        responseType: "stream",
      });

      const fileName = `${uuidv4()}.jpg`;
      const filePath = path.join(UPLOAD_DIR, fileName);

      const writer = fs.createWriteStream(filePath);
      response.data.pipe(writer);

      return new Promise((resolve, reject) => {
        writer.on("finish", () => {
          resolve(`/uploads/${fileName}`);
        });
        writer.on("error", reject);
      });
    } catch (err) {
      throw new ServerError("Upload image error");
    }
  }
  static deleteImage() {}
  static getImageUrl() {}
}
