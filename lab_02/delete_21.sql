DELETE FROM bets
WHERE fk_bookmaker in (SELECT pk
                       FROM bookmakers
                       WHERE is_official=0)
