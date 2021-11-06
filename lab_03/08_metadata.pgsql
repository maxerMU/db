CREATE OR REPLACE PROCEDURE get_db_metadata(db_name text)
AS $$
DECLARE
    dbid int;
    dbconnlimit int;
BEGIN
    SELECT oid, datconnlimit INTO dbid, dbconnlimit
    FROM pg_database
    WHERE datname = db_name;

    RAISE NOTICE 'db id: % db connection limit: %', dbid, dbconnlimit;

END;
$$ LANGUAGE PLPGSQL;

CALL get_db_metadata('betsdb');