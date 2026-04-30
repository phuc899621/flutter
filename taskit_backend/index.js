import { server } from "./app.js";
import dotenv from "dotenv";
dotenv.config();
const port = process.env.PORT || 8080;
server.listen(port, () => {
  console.log(`Socket server listening on port http://localhost:${port}`);
});
