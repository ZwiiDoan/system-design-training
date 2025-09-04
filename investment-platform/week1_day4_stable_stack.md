# 📅 Week 1 Day 4 — Build (Stable Stack + Anti‑Churn Architecture) — **Tailwind v4 + Registrar Fix**

> **Update:** fixed the invalid assignment `(_usePrices as unknown as UsePrices) = usePricesQuery;`  
> Now using a **registrar pattern** so imports remain read‑only and UI stays library‑agnostic.

---

## 🎯 Objectives (2 hours)
- Stable stack (React + Vite, Tailwind v4, Router, TanStack Query, zod, MSW).
- Anti‑churn architecture (`domain / app / infra / core / ui`).
- Registrar pattern for wiring infra → app hooks.

---

## 🔑 Registrar Pattern for Hooks

### 1) Stable app‑level hook + registrar
`src/features/crypto/app/usePrices.ts`
```ts
import type { Price } from "../domain/types";

export type UsePrices = (symbol: string) =>
  { data?: Array<Price>; isLoading: boolean; error?: Error };

let impl: UsePrices = () => {
  throw new Error("usePrices implementation not registered");
};

export function registerUsePrices(fn: UsePrices) {
  impl = fn;
}

export function usePrices(symbol: string) {
  return impl(symbol);
}
```

### 2) Infra implementation (TanStack Query)
`src/features/crypto/infra/queryPrices.ts`
```ts
import { useQuery } from "@tanstack/react-query";
import { http } from "@/core/http/client";
import { Price } from "../domain/types";
import type { UsePrices } from "../app/usePrices";

async function fetchPrices(symbol: string) {
  const base = import.meta.env.VITE_API_BASE ?? "http://localhost:8080";
  const url = new URL("/api/v1/crypto/prices", base);
  url.searchParams.set("symbol", symbol);
  const raw = await http.get<unknown>(url.toString());
  return Price.array().parse(raw);
}

export const usePricesQuery: UsePrices = (symbol) => {
  const q = useQuery({ queryKey: ["prices", symbol], queryFn: () => fetchPrices(symbol), staleTime: 10_000 });
  return { data: q.data, isLoading: q.isLoading, error: q.error as Error | undefined };
};
```

### 3) Register infra implementation at startup
`src/main.tsx`
```ts
import React from "react";
import ReactDOM from "react-dom/client";
import { RouterProvider } from "react-router-dom";
import { router } from "@/app/router";
import { Providers } from "@/app/providers";
import "./index.css";

import { registerUsePrices } from "@/features/crypto/app/usePrices";
import { usePricesQuery } from "@/features/crypto/infra/queryPrices";

registerUsePrices(usePricesQuery);

async function enableMocks() {
  if (import.meta.env.DEV) {
    const { worker } = await import("./mocks");
    await worker.start({ onUnhandledRequest: "bypass" });
  }
}

enableMocks().then(() => {
  ReactDOM.createRoot(document.getElementById("root")!).render(
    <React.StrictMode>
      <Providers><RouterProvider router={router} /></Providers>
    </React.StrictMode>
  );
});
```

### 4) UI stays library‑agnostic
`src/features/crypto/ui/CryptoPage.tsx`
```tsx
import { useState } from "react";
import { usePrices } from "../app/usePrices";

export default function CryptoPage() {
  const [symbol, setSymbol] = useState("BTCUSDT");
  const { data, isLoading, error } = usePrices(symbol);
  // ...
}
```

---

## ✅ Deliverables
- Tailwind v4 correctly setup via Vite plugin (`@tailwindcss/vite`, `@import "tailwindcss";` in `index.css`).
- Registrar pattern replaces invalid import reassignment.
- UI continues to consume `usePrices` without knowing about TanStack Query.
