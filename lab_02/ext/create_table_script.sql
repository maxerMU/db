drop table if EXISTS table_1;
drop table if EXISTS table_2;

CREATE TABLE table_1 (
  id                INTEGER,
  var1              VARCHAR,
  valid_from_dttm   DATE,
  valid_to_dttm     DATE
);

INSERT INTO table_1 (id, var1, valid_from_dttm, valid_to_dttm) VALUES
(1, 'A', '2018-09-01', '2018-09-15'),
(1, 'B', '2018-09-16', '5999-12-31');

CREATE TABLE table_2 (
  id                INTEGER,
  var2              VARCHAR,
  valid_from_dttm   DATE,
  valid_to_dttm     DATE
);

INSERT INTO table_2 (id, var2, valid_from_dttm, valid_to_dttm) VALUES
(1, 'A', '2018-09-01', '2018-09-18'),
(1, 'B', '2018-09-19', '5999-12-31');

SELECT t1.id, var1, var2, 
       GREATEST(t1.valid_from_dttm, t2.valid_from_dttm) as valid_from,
       LEAST(t1.valid_to_dttm, t2.valid_to_dttm) as valid_to
FROM table_1 t1 JOIN table_2 t2 on t1.id = t2.id
WHERE GREATEST(t1.valid_from_dttm, t2.valid_from_dttm) < LEAST(t1.valid_to_dttm, t2.valid_to_dttm);

drop table table_1;
drop table table_2;
