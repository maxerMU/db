CREATE OR REPLACE PROCEDURE select_customers_by_game_id(game_id int4)
AS $$
    prep = plpy.prepare("SELECT c.name FROM bets b JOIN customers c on b.fk_customer = c.pk WHERE fk_game=$1;", ["int4"])
    result = plpy.execute(prep, [game_id])
    for customer in result:
        plpy.notice(f"{customer['name']}")
$$ LANGUAGE PLPYTHON3U;

CALL select_customers_by_game_id(1);