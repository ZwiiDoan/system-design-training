import { z } from "zod";

export const Price = z.object({
  symbol: z.string(),
  price: z.number(),
  ts: z.number(),
});
export type Price = z.infer<typeof Price>;