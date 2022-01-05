\c betsdb

\t \a

\o data/bets.json
SELECT row_to_json(b) FROM bets b;

\o data/customers.json
SELECT row_to_json(c) FROM customers c;

\o data/games.json
SELECT row_to_json(g) FROM games g;

\o data/bookmakers.json
SELECT row_to_json(b) FROM bookmakers b;

\o

DROP TABLE IF EXISTS customers_from_json;
CREATE TABLE customers_from_json (
    pk INTEGER PRIMARY KEY,
    name TEXT not NULL,
    surname TEXT not NULL,
    phone_number TEXT not NULL,
    country TEXT
);

DROP TABLE IF EXISTS temp;
CREATE TABLE temp (
    data jsonb
);

-- path in docker container
COPY temp(data) FROM '/home/lab_05/data/customers.json';
INSERT INTO customers_from_json(pk, name, surname, phone_number, country)
SELECT (data->>'pk')::INTEGER, data->>'name', data->>'surname', data->>'phone_number', data->>'country'
FROM temp;


DROP TABLE IF EXISTS context;
CREATE TABLE context (
    data jsonb
);

INSERT INTO context(data) VALUES
('{"team_name": "MU", "foundation_year": 1878, "stadium": {"name": "Old Trafford", "city": "Manchester"}}'),
('{"team_name": "CSKA", "foundation_year": 1911, "stadium": {"name": "VEB", "city": "Moscow"}}');

SELECT data->'stadium' FROM context;
SELECT data->'stadium'->'city'
FROM context;

CREATE OR REPLACE FUNCTION if_key_exists(json_to_check jsonb, key text)
RETURNS BOOLEAN 
AS $$
BEGIN
    RETURN (json_to_check->key) IS NOT NULL;
END;
$$ LANGUAGE PLPGSQL;

SELECT if_key_exists('{"team_name": "MU", "foundation_year": 1878}', 'stadium');
SELECT if_key_exists('{"team_name": "MU", "foundation_year": 1878}', 'team_name');

UPDATE context SET data = data || '{"foundation_year": 1900}'::jsonb WHERE (data->'foundation_year')::INT  < 1900;

SELECT * FROM jsonb_array_elements('[
    {"team_name": "MU", "foundation_year": 1878, "stadium": {"name": "Old Trafford", "city": "Manchester"}},
    {"team_name": "CSKA", "foundation_year": 1911, "stadium": {"name": "VEB", "city": "Moscow"}}
]');

----------------------------


CREATE OR REPLACE FUNCTION winings2()
RETURNS TABLE (is_official int, res float)
AS $$

BEGIN
    return QUERY
        WITH CTE(is_official, price, coefficient, customer_prediction, result) as (
            SELECT book.is_official, b.price, b.coefficient, b.customer_prediction, 
            CASE 
            WHEN home_team_goals = away_team_goals THEN 0
            WHEN home_team_goals > away_team_goals THEN 1
            ELSE 2
            END as result
            FROM bets b JOIN games g on b.fk_game = g.pk JOIN bookmakers book on book.pk = b.fk_bookmaker
        )
        SELECT is_official, sum(price * coefficient) as res
        FROM CTE
        WHERE result = customer_prediction
        GROUP BY is_official;
END;
$$
LANGUAGE PLPGSQL;

\o data/res.json
SELECT row_to_json(w) FROM winings2() w;