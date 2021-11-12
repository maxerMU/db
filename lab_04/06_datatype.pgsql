DROP FUNCTION IF EXISTS set_cust_data;
DROP TYPE IF EXISTS cust_data;
CREATE TYPE cust_data AS (
    cust_name text,
    surname text,
    phone_number text
);

CREATE OR REPLACE FUNCTION set_cust_data(cust_name text, surname text, phone_number text)
RETURNS SETOF cust_data
AS $$
    return ([cust_name, surname, phone_number],)
$$ LANGUAGE PLPYTHON3U;

SELECT * FROM set_cust_data('Max', 'Mitsevich', '+79151234598');