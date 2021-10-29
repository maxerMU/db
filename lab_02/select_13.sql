SELECT bookmakers.name
FROM bookmakers
WHERE bookmakers.pk = (SELECT fk_bookmaker
                       FROM bets
                       GROUP BY fk_bookmaker
                       HAVING SUM(state) = (SELECT MAX(ss)
                                            FROM (SELECT SUM(state) as ss
                                                  FROM bets
                                                  GROUP BY fk_bookmaker
                                                  ) as OD
                                            )
                      )
