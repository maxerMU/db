CREATE EXTENSION IF NOT EXISTS plpython3u;

CREATE OR REPLACE PROCEDURE bets_paid_py(game_id int4)
AS $$
    prep = plpy.prepare("UPDATE bets SET state=1 WHERE fk_game=$1;", ["int4"])
    plpy.execute(prep, [game_id])
$$ LANGUAGE PLPYTHON3U;

SELECT state from bets WHERE fk_game=0;
CALL bets_paid_py(0);
SELECT state from bets WHERE fk_game=0;