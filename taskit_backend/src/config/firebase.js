import { initializeApp, cert } from "firebase-admin/app";
import serviceAccount from "../../firebase-adminsdk.json" with { type: "json" };

initializeApp({
  credential: cert(serviceAccount),
});
console.log("Firebase Admin initialized");
