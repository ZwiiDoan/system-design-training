import { createBrowserRouter } from "react-router-dom";
import CryptoPage from "../features/crypto/ui/CryptoPage";
export const router = createBrowserRouter([ { path: "/", element: <CryptoPage /> } ]);