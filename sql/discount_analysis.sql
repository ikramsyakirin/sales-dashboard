-- Discount analysis: profit and margin by discount band
-- Dataset: Superstore (Kaggle). Run with DuckDB in Google Colab.
SELECT
  CASE
    WHEN Discount = 0 THEN '1) No discount'
    WHEN Discount <= 0.2 THEN '2) Up to 20%'
    WHEN Discount <= 0.4 THEN '3) 21% to 40%'
    ELSE '4) Over 40%'
  END AS discount_band,
  ROUND(SUM(Profit), 0) AS total_profit,
  ROUND(SUM(Profit) / SUM(Sales) * 100, 1) AS margin_pct
FROM df
GROUP BY discount_band
ORDER BY discount_band;
