CREATE EXTENSION IF NOT EXISTS plpython3u;

CREATE OR REPLACE FUNCTION bookmakers_num_in_country_py(country_name text)
RETURNS INTEGER
AS $$
    query = f"SELECT count(*) FROM bookmakers where country='{country_name}';"
    result = plpy.execute(query)

    return result[0]["count"]
$$ LANGUAGE PLPYTHON3U;

SELECT * FROM bookmakers_num_in_country_py('Ukraine');