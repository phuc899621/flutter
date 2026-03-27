import bcrypt from "bcryptjs";
export class HashHelper {
  static hash(value) {
    return bcrypt.hash(value, 10);
  }
  static compare(value, hash) {
    return bcrypt.compare(value, hash);
  }
}
