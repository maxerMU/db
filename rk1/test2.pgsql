CREATE table IF NOT EXISTS work_type (
    pk int,
    work_name text,
    time_need int,
    equipment text
);

CREATE table IF NOT EXISTS customer(
    pk int,
    full_name text,
    birth_year int,
    expirience int,
    phone_number text
);

CREATE table IF NOT EXISTS perfomer(
    pk int,
    full_name text,
    birth_year int,
    expirience int,
    phone_number text
);

CREATE table IF NOT EXISTS cw(
    fk_work_type int,
    fk_customer int
);

CREATE table IF NOT EXISTS cp(
    fk_perfomer int,
    fk_customer int
);

CREATE table IF NOT EXISTS wp(
    fk_perfomer int,
    fk_work_type int
);


INSERT INTO work_type(pk, work_name, time_need, equipment) VALUES
(0, 'qwer', 100, 'maax fadsf fas');

INSERT INTO work_type(pk, work_name, time_need, equipment) VALUES
(1, 'qfdsakljlwer', 1000, 'madafsljkax fadsf fas');

INSERT INTO work_type(pk, work_name, time_need, equipment) VALUES
(2, 'akljlwer', 1005, 'msljkax fadsf fas');

INSERT INTO work_type(pk, work_name, time_need, equipment) VALUES
(3, 'akafaljlwer', 4005, 'mkax fadsf fas');

INSERT INTO work_type(pk, work_name, time_need, equipment) VALUES
(4, 'awer', 5005, 'mdfsljfkax fadsf fas');

INSERT INTO work_type(pk, work_name, time_need, equipment) VALUES
(5, 'qwerar', 5635, 'mdkax ff fas');

INSERT INTO work_type(pk, work_name, time_need, equipment) VALUES
(6, 'qwertyunar', 7841, 'mdfjaslkdkax ff fas');

INSERT INTO work_type(pk, work_name, time_need, equipment) VALUES
(7, 'ertyunar', 7410, 'slkdkax ff fas');

INSERT INTO work_type(pk, work_name, time_need, equipment) VALUES
(8, 'etuqertyunar', 8410, 'slkiodkax ff fas');

INSERT INTO work_type(pk, work_name, time_need, equipment) VALUES
(9, 'etyunar', 9102, 'slkiodkax fas');


INSERT INTO customer(pk, full_name, birth_year, expirience, phone_number) VALUES
(0, 'etyunar', 1992, 2, '2315');

INSERT INTO customer(pk, full_name, birth_year, expirience, phone_number) VALUES
(1, 'yunar', 1993, 3, '2316');

INSERT INTO customer(pk, full_name, birth_year, expirience, phone_number) VALUES
(2, 'yunar fjdsakl', 1994, 2, '2317');

INSERT INTO customer(pk, full_name, birth_year, expirience, phone_number) VALUES
(3, 'yunar fjdsl jf', 1995, 5, '2318');

INSERT INTO customer(pk, full_name, birth_year, expirience, phone_number) VALUES
(4, 'yar fsl jf', 15, 1954, '2319');

INSERT INTO customer(pk, full_name, birth_year, expirience, phone_number) VALUES
(5, 'yar fasdjfksl jf', 1989, 1, '2320');

INSERT INTO customer(pk, full_name, birth_year, expirience, phone_number) VALUES
(6, 'yar ffksl yt', 1993, 9, '2321');

INSERT INTO customer(pk, full_name, birth_year, expirience, phone_number) VALUES
(7, 'sadfkjyar fsl yt', 2000, 3, '2322');

INSERT INTO customer(pk, full_name, birth_year, expirience, phone_number) VALUES
(8, 'sayar fsfdajskll yt', 1992, 5, '2323');

INSERT INTO customer(pk, full_name, birth_year, expirience, phone_number) VALUES
(9, 'sayar fsfskll yasdfat', 1962, 25, '2324');


INSERT INTO perfomer(pk, full_name, birth_year, expirience, phone_number) VALUES
(0, 'etyunar', 1992, 2, '2315');

INSERT INTO perfomer(pk, full_name, birth_year, expirience, phone_number) VALUES
(1, 'yunar', 1993, 3, '2316');

INSERT INTO perfomer(pk, full_name, birth_year, expirience, phone_number) VALUES
(2, 'yunar fjdsakl', 1994, 2, '2317');

INSERT INTO perfomer(pk, full_name, birth_year, expirience, phone_number) VALUES
(3, 'yunar fjdsl jf', 1995, 5, '2318');

INSERT INTO perfomer(pk, full_name, birth_year, expirience, phone_number) VALUES
(4, 'yar fsl jf', 15, 1954, '2319');

INSERT INTO perfomer(pk, full_name, birth_year, expirience, phone_number) VALUES
(5, 'yar fasdjfksl jf', 1989, 1, '2320');

INSERT INTO perfomer(pk, full_name, birth_year, expirience, phone_number) VALUES
(6, 'yar ffksl yt', 1993, 9, '2321');

INSERT INTO perfomer(pk, full_name, birth_year, expirience, phone_number) VALUES
(7, 'sadfkjyar fsl yt', 2000, 3, '2322');

INSERT INTO perfomer(pk, full_name, birth_year, expirience, phone_number) VALUES
(8, 'sayar fsfdajskll yt', 1992, 5, '2323');

INSERT INTO perfomer(pk, full_name, birth_year, expirience, phone_number) VALUES
(9, 'sayar fsfskll yasdfat', 1962, 25, '2324');


INSERT INTO cw(fk_work_type, fk_customer) VALUES
(9, 1);

INSERT INTO cw(fk_work_type, fk_customer) VALUES
(8, 2);

INSERT INTO cw(fk_work_type, fk_customer) VALUES
(3, 4);

INSERT INTO cw(fk_work_type, fk_customer) VALUES
(5, 6);

INSERT INTO cw(fk_work_type, fk_customer) VALUES
(8, 4);

INSERT INTO cw(fk_work_type, fk_customer) VALUES
(9, 0);

INSERT INTO cw(fk_work_type, fk_customer) VALUES
(5, 5);

INSERT INTO cw(fk_work_type, fk_customer) VALUES
(6, 7);


INSERT INTO cp(fk_perfomer, fk_customer) VALUES
(9, 1);

INSERT INTO cp(fk_perfomer, fk_customer) VALUES
(8, 2);

INSERT INTO cp(fk_perfomer, fk_customer) VALUES
(3, 4);

INSERT INTO cp(fk_perfomer, fk_customer) VALUES
(5, 6);

INSERT INTO cp(fk_perfomer, fk_customer) VALUES
(8, 4);

INSERT INTO cp(fk_perfomer, fk_customer) VALUES
(9, 0);

INSERT INTO cp(fk_perfomer, fk_customer) VALUES
(5, 5);

INSERT INTO cp(fk_perfomer, fk_customer) VALUES
(6, 7);


INSERT INTO wp(fk_perfomer, fk_work_type) VALUES
(9, 1);

INSERT INTO wp(fk_perfomer, fk_work_type) VALUES
(8, 2);

INSERT INTO wp(fk_perfomer, fk_work_type) VALUES
(3, 4);

INSERT INTO wp(fk_perfomer, fk_work_type) VALUES
(5, 6);

INSERT INTO wp(fk_perfomer, fk_work_type) VALUES
(8, 4);

INSERT INTO wp(fk_perfomer, fk_work_type) VALUES
(9, 0);

INSERT INTO wp(fk_perfomer, fk_work_type) VALUES
(5, 5);

INSERT INTO wp(fk_perfomer, fk_work_type) VALUES
(6, 7);

-- Находит всех имена заказчиков, у которых год рождения больше 2000
SELECT full_name
FROM customer
WHERE birth_year > 2000;

-- Находит имена всех работников, которые выполняют какую-то работу, их трудозатраты и суммарное время, которое требуется по этому типу работы
SELECT full_name, time_need,  sum(time_need) OVER (PARTITION BY work_name) as sum_time_need
FROM (work_type w JOIN cw on cw.fk_work_type = w.pk) wcw JOIN customer c on wcw.fk_customer = c.pk;
--
--
--
--SELECT *
--FROM information_schema.ROUTINES
--LIMIT 1;
--
--SELECT prosrc
--FROM pg_proc
--limit 1;

CREATE OR replace PROCEDURE get_proc_with_recompile(proc_part text)
AS $$
declare
    elem pg_proc;
BEGIN
    for elem in
    SELECT p.proname as proname
    FROM information_schema.ROUTINES inf JOIN pg_proc p on inf.routine_name = p.proname
    WHERE (inf.routine_definition LIKE '%WITH RECOMPILE%') and (p.prosrc like concat('%', proc_part, '%')) and inf.routine_type='PROCEDURE'
    loop
    raise notice 'proc name: %', elem.proname;
    end loop;
    
END;
$$
LANGUAGE plpgsql;
