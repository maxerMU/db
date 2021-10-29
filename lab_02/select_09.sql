SELECT fk_customer, fk_game,
         CASE
              WHEN (customer_prediction = 0) THEN 'draw'
              WHEN (customer_prediction = 1) THEN 'win home'
              WHEN (customer_prediction = 2) THEN 'win away'
         END AS prediciton
FROM bets;

