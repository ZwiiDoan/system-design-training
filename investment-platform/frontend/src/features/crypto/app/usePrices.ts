import type { Price } from "../domain/types";

export type UsePrices = (symbol: string) =>
  { data?: Array<Price>; isLoading: boolean; error?: Error };

let impl: UsePrices = () => {
  throw new Error("usePrices implementation not registered");
};

export function registerUsePrices(fn: UsePrices) {
  impl = fn;
}

// This is what UI imports & calls. It stays stable forever.
export function usePrices(symbol: string) {
  return impl(symbol);
}
