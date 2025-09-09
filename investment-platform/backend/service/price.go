package service

import (
	"encoding/json"
	"fmt"
	"net/http"
)

type TickerResponse struct {
	Symbol string `json:"symbol"`
	Price  string `json:"price"`
}

func GetPrice(symbol string) (TickerResponse, error) {
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
