CREATE OR REPLACE PROCEDURE find_root_bookmaker(bookmaker_id int4)
AS $$
    DECLARE parent_bookmaker_id int4;
BEGIN
    SELECT parent_id INTO parent_bookmaker_id
    FROM bookmakers
    WHERE pk = bookmaker_id;

    IF parent_bookmaker_id IS null THEN
        RAISE NOTICE '%: is a root', parent_bookmaker_id;
    ELSE
        RAISE NOTICE '%: is not a root', parent_bookmaker_id;
        CALL find_root_bookmaker(parent_bookmaker_id);
    END IF;
END;
$$ LANGUAGE PLPGSQL;

CALL find_root_bookmaker(10);

