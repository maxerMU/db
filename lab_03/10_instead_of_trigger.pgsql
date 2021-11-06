CREATE OR REPLACE FUNCTION no_united_home_lose() RETURNS TRIGGER AS $$
BEGIN
    IF lower(NEW.home_team_name) like '%manchester united%' AND NEW.home_team_goals < NEW.away_team_goals THEN
        RAISE NOTICE 'united can not lose at Old Trafford. belive in solscjaer';
    ELSE 
        INSERT INTO games (
            pk,
            home_team_name,
            away_team_name,
            home_team_goals,
            away_team_goals,
            is_finished
        )
        VALUES (
            NEW.pk,
            NEW.home_team_name,
            NEW.away_team_name,
            NEW.home_team_goals,
            NEW.away_team_goals,
            NEW.is_finished
        );
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;

CREATE OR REPLACE VIEW games_view AS
SELECT *
FROM games;

CREATE TRIGGER trg_no_united_home_lose INSTEAD OF
INSERT ON games_view
FOR EACH ROW EXECUTE PROCEDURE no_united_home_lose();

INSERT INTO games_view (
    pk,
    home_team_name,
    away_team_name,
    home_team_goals,
    away_team_goals,
    is_finished
)
VALUES (
    1002,
    'Manchester United',
    'Aston villa',
    0,
    1,
    1
);