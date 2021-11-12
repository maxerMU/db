CREATE OR REPLACE FUNCTION result_trigger_py()
RETURNS TRIGGER
AS $$
    if TD["new"]["home_team_goals"] > TD["new"]["away_team_goals"]:
        plpy.notice(f"{TD['new']['home_team_name']} has won {TD['new']['away_team_name']}")
    elif TD["new"]["home_team_goals"] == TD["new"]["away_team_goals"]:
        plpy.notice(f"{TD['new']['home_team_name']} against {TD['new']['away_team_name']} result is draw")
    else:
        plpy.notice(f"{TD['new']['home_team_name']} has lost {TD['new']['away_team_name']}")

$$ LANGUAGE PLPYTHON3U;

CREATE TRIGGER game_result_trigger_py AFTER INSERT ON games
FOR ROW EXECUTE PROCEDURE result_trigger_py();

DELETE FROM games where pk = 1001;

INSERT INTO games (
    pk,
    home_team_name,
    away_team_name,
    home_team_goals,
    away_team_goals,
    is_finished
)
VALUES (
    1001,
    'Manchester United',
    'Aston villa',
    0,
    1,
    1
);
