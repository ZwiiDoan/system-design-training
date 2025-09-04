export type HttpClient = {
  get<T>(url: string, opts?: RequestInit): Promise<T>;
  post<T>(url: string, body: unknown, opts?: RequestInit): Promise<T>;
};

export const http: HttpClient = {
  async get(url, opts) {
    const r = await fetch(url, { ...opts, headers: { "Content-Type": "application/json", ...(opts?.headers||{}) } });
    if (!r.ok) throw new Error(`${r.status} ${r.statusText}`);
    return r.json();
  },
  async post(url, body, opts) {
    const r = await fetch(url, { method: "POST", body: JSON.stringify(body), ...opts,
      headers: { "Content-Type": "application/json", ...(opts?.headers||{}) } });
    if (!r.ok) throw new Error(`${r.status} ${r.statusText}`);
    return r.json();
  },
};