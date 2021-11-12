CREATE EXTENSION IF NOT EXISTS plpython3u;

CREATE OR REPLACE FUNCTION customers_in_same_country_py()
RETURNS TABLE (
    cust_name text,
    book_name text,
    country text
)
AS $$
    query = "SELECT c.name as cust_name, book.name as book_name, c.country as country " \
            "FROM customers c JOIN bets bet " \
            "on c.pk = bet.fk_customer JOIN bookmakers book " \
            "on book.pk = bet.fk_bookmaker WHERE c.country = book.country;"
    result = plpy.execute(query)

    for row in result:
        yield (row["cust_name"], row["book_name"], row["country"])
$$ LANGUAGE PLPYTHON3U;

SELECT * FROM customers_in_same_country_py();