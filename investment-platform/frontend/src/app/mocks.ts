import { setupWorker } from "msw/browser";
import { handlers } from "../features/crypto/infra/mocks";
export const worker = setupWorker(...handlers);