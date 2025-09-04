import React from "react";
import ReactDOM from "react-dom/client";
import { RouterProvider } from "react-router-dom";
import { router } from "./app/router";
import { Providers } from "./app/providers";
import "./index.css";
import { usePricesQuery } from "./features/crypto/infra/queryPrices";
import { registerUsePrices } from "./features/crypto/app/usePrices";

// register infra implementations before rendering
registerUsePrices(usePricesQuery);

async function enableMocks() {
  if (import.meta.env.DEV) {
    const { worker } = await import("./app/mocks");
    await worker.start({ onUnhandledRequest: "bypass" });
  }
}
enableMocks().then(() => {
  ReactDOM.createRoot(document.getElementById("root")!).render(
    <React.StrictMode><Providers><RouterProvider router={router} /></Providers></React.StrictMode>
  );
});