CREATE OR REPLACE FUNCTION w1_wins()
RETURNS TABLE (winner_id int4, total_win float4)
AS $$
BEGIN
    CREATE TEMP TABLE tmp_wins (cust_id int4, price float4);

    INSERT INTO tmp_wins (cust_id, price)
    SELECT fk_customer, price * coefficient as total_win
    FROM bets b JOIN games g on b.fk_game = g.pk JOIN customers c on c.pk = b.fk_customer
    WHERE home_team_goals > away_team_goals and customer_prediction = 1;

    RETURN QUERY
        SELECT cust_id, sum(price)
        FROM tmp_wins
        GROUP BY cust_id;
END;
$$ LANGUAGE PLPGSQL;

SELECT * FROM w1_wins();