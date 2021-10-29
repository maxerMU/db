SELECT pk, name
FROM bookmakers
WHERE EXISTS
    (SELECT *
     FROM bets
     WHERE bets.fk_bookmaker=bookmakers.pk and bets.state=0)
