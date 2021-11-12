CREATE EXTENSION IF NOT EXISTS plpython3u;

CREATE OR REPLACE FUNCTION avg_bookmakers_num_in_country_py()
RETURNS float
AS $$
    query = "SELECT DISTINCT country FROM bookmakers;"
    countries_res = plpy.execute(query)
    if len(countries_res) == 0:
        return 0

    sum = 0
    for country in countries_res:
        name = country["country"]
        query = f"SELECT * FROM bookmakers_num_in_country_py('{name}')"
        sum_res = plpy.execute(query)
        sum += sum_res[0]["bookmakers_num_in_country_py"]

    return sum / len(countries_res)
$$ LANGUAGE PLPYTHON3U;

SELECT * FROM avg_bookmakers_num_in_country_py();