import { healthCheck } from "./api.js";

(async () => {
  const result = await healthCheck();
  console.log("Backend says:", result);
})();
