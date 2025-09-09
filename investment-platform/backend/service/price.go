package service

import (
	"fmt"

	"github.com/go-resty/resty/v2"
)

type TickerResponse struct {
	Symbol string `json:"symbol"`
	Price  string `json:"price"`
}

func GetPrice(symbol string) (TickerResponse, error) {
	url := fmt.Sprintf("https://api.binance.com/api/v3/ticker/price?symbol=%s", symbol)
	client := resty.New()
	var ticker TickerResponse
	resp, err := client.R().SetResult(&ticker).Get(url)
	if err != nil {
		return TickerResponse{}, err
	}
	if resp.IsError() {
		return TickerResponse{}, fmt.Errorf("API error: %s", resp.Status())
	}
	return ticker, nil
}
