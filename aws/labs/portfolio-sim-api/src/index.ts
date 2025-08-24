import express from 'express';
import { simulatePortfolio, calculateMetrics } from './simulator';

const app = express();
app.use(express.json());

// Add a simple logging middleware
app.use((req, _res, next) => {
  console.log(`${new Date().toISOString()} - ${req.method} ${req.originalUrl}`);
  next();
});

app.get('/health', (_req, res) => {
  res.status(200).json({ status: 'ok' });
});

app.get('/metrics', (_req, res) => {
  // Example portfolio for metrics calculation
  const assets = ['AAPL', 'GOOGL', 'MSFT'];
  const weights = [0.4, 0.3, 0.3];
  const simulation = simulatePortfolio(assets, weights);
  res.json(calculateMetrics(simulation));
});

app.post('/simulate', (req, res) => {
  const { assets, weights, periods } = req.body;
  if (!Array.isArray(assets) || !Array.isArray(weights) || assets.length !== weights.length) {
    return res.status(400).json({ error: 'Invalid portfolio config' });
  }
  const result = simulatePortfolio(assets, weights, periods || 252);
  res.json(result);
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Portfolio Sim API running on port ${PORT}`);
});
