CREATE OR REPLACE PROCEDURE bookmakers_list_by_country(book_country text)
AS $$
DECLARE
    book_name text;
    book_id int4;
    listcur CURSOR (book_country text) FOR
        SELECT pk, name
        FROM bookmakers
        WHERE country = book_country;
BEGIN
    OPEN listcur(book_country);
    LOOP
        FETCH listcur INTO book_id, book_name;
        RAISE NOTICE 'id: % name: %', book_id, book_name;
        EXIT WHEN NOT FOUND;
    END LOOP;
    CLOSE listcur;
END;
$$ LANGUAGE PLPGSQL;

-- call bookmakers_list_by_country('Ukraine');
