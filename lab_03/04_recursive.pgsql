CREATE OR REPLACE FUNCTION bookmakers_by_depth(depth integer)
RETURNS TABLE (bookmaker_id int4, bookmaker_name text)
AS $$
BEGIN
    RETURN QUERY
        with RECURSIVE tCTE(pk, name, parent_id, level) as (
            select pk, name, parent_id, 0
            from bookmakers
            where parent_id is null
            union all
            select  b.pk, b.name, b.parent_id, tCTE.level + 1
            from bookmakers b JOIN tCTE on b.parent_id = tCTE.pk
        )
        select pk, name from tCTE
        where level = depth;
END;
$$ LANGUAGE PLPGSQL;

-- SELECT * FROM bookmakers_by_depth(0);
