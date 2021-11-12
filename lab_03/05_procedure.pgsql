CREATE OR REPLACE PROCEDURE bets_paid(game_id int4)
AS $$
BEGIN
    UPDATE bets
    SET state = 1
    WHERE fk_game = game_id;
END;
$$ LANGUAGE PLPGSQL;

-- CALL bets_paid(2);

-- SELECT state from bets WHERE fk_game=2;
