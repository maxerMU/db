SELECT name, surname, AVG(bet.customer_prediction) as AvgPrediction
FROM customers c LEFT JOIN bets bet on c.pk = bet.fk_customer
WHERE country='Brazil'
GROUP BY name, surname
