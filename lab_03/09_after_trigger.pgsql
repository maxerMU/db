CREATE OR REPLACE FUNCTION print_bet_res() RETURNS TRIGGER AS $$
DECLARE
    game_state int4;
    game_res int4;
BEGIN
    SELECT is_finished,
    CASE
        WHEN home_team_goals = away_team_goals THEN 0
        WHEN home_team_goals > away_team_goals THEN 1
        ELSE 2
    END AS game_res INTO game_state, game_res
    FROM games
    WHERE pk = NEW.fk_game;

    IF game_state = 0 THEN
        RAISE NOTICE 'game has not finished yet';
    ELSIF game_res = NEW.customer_prediction THEN
        RAISE NOTICE 'customer has won';
    ELSE
        RAISE NOTICE 'customer has lost';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER trg_print_bet_res AFTER
INSERT ON bets
FOR ROW EXECUTE PROCEDURE print_bet_res();

-- INSERT INTO bets(fk_bookmaker, fk_game, fk_customer, customer_prediction, coefficient, price, state)
-- VALUES (1, 1, 0, 2, 1.5, 102, 0);
