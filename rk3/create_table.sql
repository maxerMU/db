create table if not exists workers (
id serial primary key,
fio text,
birthday date,
department text
);

create table if not exists accounting (
id serial primary key,
worker_id int,
foreign key (worker_id) references workers (id),
date_ date,
week_day text,
time_ time,
type_ smallint
);

insert into workers (fio, birthday, department)
values ('AAA', '2001-06-17', 'it'),
('BBB', '2001-1-14', 'Buhg'),
('CCC', '2000-7-14', 'hehe'),
('EEE', '1988-4-1', 'hehe'),
('DDD', '1988-4-1', 'kljdfas');

--insert into accounting (worker_id, date_, week_day, time_, type_)
--values (1, '2018-12-14', 'Saturday', '9:00', 1),
-- (1, '2018-12-14', 'Saturday', '9:20', 2),
-- (1, '2018-12-14', 'Saturday', '9:25', 1),
-- (2, '2018-12-14', 'Saturday', '9:05', 1);

-- insert into workers (fio, birthday, department)
-- values ('DDD', '2001-06-17', 'it');
-- 
-- insert into accounting (worker_id, date_, week_day, time_, type_)
-- values (4, '2018-12-26', 'Sunday', '8:05', 1);

insert into accounting (worker_id, date_, week_day, time_, type_)
values
(1, '2018-12-15', 'Суббота', '09:00', 1),
(1, '2018-12-15', 'Суббота', '09:20', 2),
(1, '2018-12-15', 'Суббота', '09:25', 1),
(2, '2018-12-15', 'Суббота', '09:05', 1),
(1, '2018-12-16', 'Суббота', '09:00', 1),
(1, '2018-12-16', 'Суббота', '09:20', 2),
(1, '2018-12-16', 'Суббота', '09:25', 1),
(2, '2018-12-16', 'Суббота', '09:05', 1),
(3, '2018-12-16', 'Суббота', '08:00', 1),
(1, '2018-12-17', 'Суббота', '09:00', 1),
(1, '2018-12-17', 'Суббота', '09:20', 2),
(1, '2018-12-17', 'Суббота', '09:25', 1),
(2, '2018-12-17', 'Суббота', '09:05', 1),
(3, '2018-12-17', 'Суббота', '08:00', 1),
(1, '2018-12-18', 'Суббота', '09:00', 1),
(1, '2018-12-18', 'Суббота', '09:20', 2),
(1, '2018-12-18', 'Суббота', '09:25', 1),
(2, '2018-12-18', 'Суббота', '09:05', 1),
(3, '2018-12-18', 'Суббота', '08:00', 1),
(1, '2018-12-19', 'Суббота', '09:00', 1),
(1, '2018-12-19', 'Суббота', '09:20', 2),
(1, '2018-12-19', 'Суббота', '09:25', 1),
(2, '2018-12-19', 'Суббота', '09:05', 1),
(3, '2018-12-19', 'Суббота', '08:00', 1),
(1, '2018-12-20', 'Суббота', '09:25', 1),
(2, '2018-12-20', 'Суббота', '09:05', 1),
(3, '2018-12-20', 'Суббота', '08:00', 1),
(1, '2018-12-21', 'Суббота', '09:25', 1),
(2, '2018-12-21', 'Суббота', '09:05', 1),
(3, '2018-12-21', 'Суббота', '08:00', 1),
(4, '2018-12-21', 'Суббота', '08:00', 1),
(4, '2018-12-21', 'Суббота', '20:00', 2);

CREATE OR REPLACE FUNCTION workers_exits()
RETURNS INTEGER AS $total$
DECLARE
    total INTEGER;
BEGIN
    with cte(worker_id) as (
        select worker_id
        from workers w join accounting a on w.id = a.worker_id
        where birthday < (now() - '18 year'::interval) and birthday > (now() - '40 year'::interval) and type_=2
        group by worker_id
        having count(*) > 3
    )
    select count(*) into total from cte;

    RETURN total;
END;
$total$ LANGUAGE plpgsql;

select workers_exits();