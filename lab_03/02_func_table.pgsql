CREATE OR REPLACE FUNCTION get_official_bookmakers()
RETURNS TABLE (id int4, book_name text)
AS $$
BEGIN
    RETURN QUERY
        SELECT bookmakers.pk, bookmakers.name
        FROM bookmakers
        WHERE is_official = 1;
END
$$ LANGUAGE PLPGSQL;

SELECT * FROM get_official_bookmakers();