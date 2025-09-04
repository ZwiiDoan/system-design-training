import { useState } from "react";
import { usePrices } from "../app/usePrices";

export default function CryptoPage() {
  const [symbol, setSymbol] = useState("BTCUSDT");
  const { data, isLoading, error } = usePrices(symbol);
  return (
    <div className="p-6 space-y-4">
      <div className="flex items-center gap-3">
        <select className="border rounded-md p-2" value={symbol} onChange={e=>setSymbol(e.target.value)}>
          <option>BTCUSDT</option><option>ETHUSDT</option>
        </select>
        <span className="text-gray-500 text-sm">Mocked via MSW in dev</span>
      </div>
      {isLoading && <div>Loading…</div>}
      {error && <div className="text-red-600">Failed to load</div>}
      {data && (
        <div className="overflow-x-auto rounded-xl border">
          <table className="min-w-full text-sm">
            <thead className="bg-gray-200 dark:bg-gray-700">
              <tr><th className="px-4 py-2 text-left">Symbol</th><th className="px-4 py-2 text-right">Price</th><th className="px-4 py-2 text-right">Time</th></tr>
            </thead>
            <tbody>
              {data.map(r => (
                <tr key={r.ts} className="border-t hover:bg-gray-100 dark:hover:bg-gray-800">
                  <td className="px-4 py-2">{r.symbol}</td>
                  <td className="px-4 py-2 text-right">${r.price.toLocaleString()}</td>
                  <td className="px-4 py-2 text-right">{new Date(r.ts).toLocaleTimeString()}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}
    </div>
  );
}