package handlers

import (
	"backend/service"
	"encoding/json"
	"log"
	"net/http"
)

type ErrorResponse struct {
	Error string `json:"error"`
}

func PriceHandler(w http.ResponseWriter, r *http.Request) {
	symbol := r.URL.Query().Get("symbol")
	if symbol == "" {
		symbol = "BTCUSDT"
	}
	ticker, err := service.GetPrice(symbol)
	w.Header().Set("Content-Type", "application/json")
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		json.NewEncoder(w).Encode(ErrorResponse{Error: "Failed to fetch price: " + err.Error()})
		log.Printf("Error fetching price for %s: %v", symbol, err)
		return
	}
	json.NewEncoder(w).Encode(ticker)
	log.Printf("Fetched price for %s: %s", ticker.Symbol, ticker.Price)
}
