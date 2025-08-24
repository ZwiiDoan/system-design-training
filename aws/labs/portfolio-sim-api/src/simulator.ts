// Lightweight simulation and metrics for investment portfolios

export interface SimulateRequest {
  assets: string[];
  weights: number[];
  periods?: number;
}

export interface SimulateResult {
  returns: number[];
  cumulative: number[];
  assets: string[];
  weights: number[];
}

export function simulatePortfolio(assets: string[], weights: number[], periods: number = 252): SimulateResult {
  // Simulate random walk returns for each asset, then combine by weights
  const returns: number[] = [];
  const cumulative: number[] = [];
  let value = 1;
  for (let t = 0; t < periods; t++) {
    // Simulate daily return: weighted sum of random normal returns
    const dailyReturns = assets.map(() => randomNormal(0.0003, 0.01));
    const portfolioReturn = dailyReturns.reduce((sum, r, i) => sum + r * weights[i], 0);
    returns.push(portfolioReturn);
    value *= 1 + portfolioReturn;
    cumulative.push(value);
  }
  return { returns, cumulative, assets, weights };
}

function randomNormal(mean = 0, std = 1) {
  // Box-Muller transform
  let u = 0, v = 0;
  while (u === 0) u = Math.random();
  while (v === 0) v = Math.random();
  return mean + std * Math.sqrt(-2.0 * Math.log(u)) * Math.cos(2.0 * Math.PI * v);
}

export function calculateMetrics(simulation: SimulateResult, riskFreeRate: number = 0.02) {
  const { returns, cumulative } = simulation;
  const periods = returns.length;

  // 1. Annualized Return
  const finalValue = cumulative[cumulative.length - 1];
  const annualizedReturn = Math.pow(finalValue, 252 / periods) - 1;

  // 2. Annualized Volatility (Standard Deviation of Daily Returns)
  const meanReturn = returns.reduce((sum, r) => sum + r, 0) / periods;
  const variance = returns.reduce((sum, r) => sum + Math.pow(r - meanReturn, 2), 0) / periods;
  const stdDev = Math.sqrt(variance);
  const annualizedVolatility = stdDev * Math.sqrt(252);

  // 3. Sharpe Ratio
  const sharpeRatio = (annualizedReturn - riskFreeRate) / annualizedVolatility;

  // 4. Maximum Drawdown
  let peak = -Infinity;
  let maxDrawdown = 0;
  for (const value of cumulative) {
    if (value > peak) {
      peak = value;
    }
    const drawdown = (value - peak) / peak;
    if (drawdown < maxDrawdown) {
      maxDrawdown = drawdown;
    }
  }

  return {
    annualizedReturn,
    annualizedVolatility,
    sharpeRatio,
    maxDrawdown,
  };
}

