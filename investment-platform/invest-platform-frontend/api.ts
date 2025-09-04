import axios from "axios";

const API_BASE = "http://localhost:8080";

export async function healthCheck() {
  const res = await axios.get(`${API_BASE}/health`);
  return res.data;
}
