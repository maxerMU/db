SELECT pk, name
FROM bookmakers as book
WHERE EXISTS (SELECT *
              FROM bets
              WHERE book.pk = bets.fk_bookmaker and bets.state = 0)
      and
      country = 'Brazil';
