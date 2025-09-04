import { useQuery } from "@tanstack/react-query";
import { http } from "../../../core/http/client";
import { Price } from "../domain/types";
import type { UsePrices } from "../app/usePrices"; // types only is OK

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