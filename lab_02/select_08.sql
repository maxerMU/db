SELECT name, surname,
                      (select AVG(customer_prediction)
                             FROM bets
                             WHERE bets.fk_customer=customers.pk) as avg_prediction
FROM customers;
