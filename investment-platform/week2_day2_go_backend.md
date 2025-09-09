# 📅 Week 2 Day 2 (Build - Go)

## Goal  
Implement a **crypto price fetcher** in the Go backend using the Binance API.

---

## Steps

### 1. Understand the Task
- Fetch real-time prices for at least one crypto pair (e.g., **BTC/USDT**) from Binance.
- Expose this data through a **REST endpoint** in your Go service.

---

### 2. Setup Dependencies
- Initialize a Go module if you haven’t already:
  ```bash
  go mod init backend
  go get github.com/go-resty/resty/v2
  ```
- `resty` will help with HTTP calls, but you can also use Go’s standard `net/http`.

---

### 3. Binance API Endpoint
Binance provides a simple ticker price API:
```
https://api.binance.com/api/v3/ticker/price?symbol=BTCUSDT
```

Sample response:
```json
{
  "symbol": "BTCUSDT",
  "price": "25837.19000000"
}
```

---

### 4. Fetch Price in Go
```go
package main

import (
    "encoding/json"
    "fmt"
    "log"
    "net/http"
)

type TickerResponse struct {
    Symbol string `json:"symbol"`
    Price  string `json:"price"`
}

func getPrice(symbol string) (TickerResponse, error) {
    url := fmt.Sprintf("https://api.binance.com/api/v3/ticker/price?symbol=%s", symbol)
    resp, err := http.Get(url)
    if err != nil {
        return TickerResponse{}, err
    }
    defer resp.Body.Close()

    var ticker TickerResponse
    if err := json.NewDecoder(resp.Body).Decode(&ticker); err != nil {
        return TickerResponse{}, err
    }
    return ticker, nil
}

func main() {
    ticker, err := getPrice("BTCUSDT")
    if err != nil {
        log.Fatal(err)
    }
    fmt.Printf("%s: %s\n", ticker.Symbol, ticker.Price)
}
```

---

### 5. Expose REST Endpoint
You can wrap this in a REST API using Go’s `net/http`:
```go
http.HandleFunc("/price", func(w http.ResponseWriter, r *http.Request) {
    ticker, err := getPrice("BTCUSDT")
    if err != nil {
        http.Error(w, "Failed to fetch price", http.StatusInternalServerError)
        return
    }
    json.NewEncoder(w).Encode(ticker)
})

log.Println("Server running on :8080")
log.Fatal(http.ListenAndServe(":8080", nil))
```

---

### 6. Test
- Run your service:
  ```bash
  go run main.go
  ```
- Call:
  ```
  curl http://localhost:8080/price
  ```

Expected output:
```json
{"symbol":"BTCUSDT","price":"25837.19000000"}
```

---

✅ **End of Day Deliverable**:  
A Go service that can fetch live crypto prices (starting with BTC/USDT) from Binance and return them via a REST API endpoint.
