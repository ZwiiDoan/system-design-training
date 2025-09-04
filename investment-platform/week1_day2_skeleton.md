# 📅 Week 1 – Day 2 (Build)

## 🎯 Goal
Set up the **Go backend service** and a **TypeScript API skeleton** for your investment platform.

---

## 🛠️ Tasks

### 1. Go Backend Setup
- Install Go (if not already installed).
- Create a new Go project:
  ```bash
  mkdir invest-platform-backend && cd invest-platform-backend
  go mod init invest-platform-backend
  ```
- Create a simple HTTP server:
  ```go
  package main

  import (
      "fmt"
      "net/http"
  )

  func main() {
      http.HandleFunc("/health", func(w http.ResponseWriter, r *http.Request) {
          fmt.Fprintln(w, "OK")
      })
      fmt.Println("Server running on :8080")
      http.ListenAndServe(":8080", nil)
  }
  ```
- Run:
  ```bash
  go run main.go
  ```
- Verify at [http://localhost:8080/health](http://localhost:8080/health).

---

### 2. TypeScript API Skeleton
- Initialize a TypeScript project:
  ```bash
  mkdir invest-platform-frontend && cd invest-platform-frontend
  npm init -y
  npm install typescript ts-node @types/node --save-dev
  npx tsc --init
  ```
- Add an API client file `api.ts`:
  ```ts
  import axios from "axios";

  const API_BASE = "http://localhost:8080";

  export async function healthCheck() {
    const res = await axios.get(`${API_BASE}/health`);
    return res.data;
  }
  ```
- Test with a script:
  ```ts
  import { healthCheck } from "./api";

  (async () => {
    const result = await healthCheck();
    console.log("Backend says:", result);
  })();
  ```

---

## ✅ Deliverable
- Running Go server with `/health` endpoint.  
- TypeScript API client confirming connection to backend.  
