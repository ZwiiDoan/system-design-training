import { http, HttpResponse } from "msw";

export const handlers = [
  http.get("http://localhost:8080/api/v1/crypto/prices", ({ request }) => {
    const url = new URL(request.url);
    const symbol = url.searchParams.get("symbol") ?? "BTCUSDT";
    const now = Date.now();
    const data = Array.from({ length: 8 }, (_, i) => ({
      symbol,
      price: 60000 + i * 25,
      ts: now - i * 60_000,
    }));
    return HttpResponse.json(data);
  }),
];