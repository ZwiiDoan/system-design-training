# Portfolio Simulation API

A lightweight REST API to simulate investment portfolio performance over time.

## Features

- **POST /simulate**: Simulate portfolio returns given assets and weights.
- **GET /health**: Health check endpoint for load balancer integration.
- **GET /metrics**: Returns mock performance metrics (volatility, Sharpe ratio, drawdown, etc).

## Quick Start

```bash
npm install
npm run dev
```

## Example Usage

### POST /simulate
```json
{
  "assets": ["AAPL", "GOOG", "BND"],
  "weights": [0.5, 0.3, 0.2],
  "periods": 252
}
```

### GET /health
Returns `{ "status": "ok" }`

### GET /metrics
Returns mock metrics like volatility, Sharpe ratio, drawdown, etc.
