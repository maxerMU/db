SELECT fk_bookmaker, fk_game, fk_customer
FROM bets
WHERE fk_bookmaker in (SELECT pk
                       FROM bookmakers
                       WHERE country = 'Ukraine');
