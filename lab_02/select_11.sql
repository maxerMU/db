DROP TABLE IF EXISTS home_team_wins;

CREATE TEMP TABLE home_team_wins AS
SELECT home_team_name, away_team_name
FROM games
WHERE home_team_goals > away_team_goals
GROUP BY home_team_name, away_team_name;
