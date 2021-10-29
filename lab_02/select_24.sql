SELECT AVG(customer_prediction) OVER(PARTITION BY g.pk) AS AvgPrediction
FROM bets b JOIN games g on b.fk_game = g.pk
