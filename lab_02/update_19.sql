UPDATE bets
SET state = (SELECT MIN(state)
             FROM bets
             WHERE fk_game=10)
WHERE fk_game=10
