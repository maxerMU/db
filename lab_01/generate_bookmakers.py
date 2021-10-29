import psycopg2
from psycopg2 import Error
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT
from faker import Faker
from random import randint

RECORDS = 1000

try:
    # Подключение к существующей базе данных
    connection = psycopg2.connect(database="betsdb",
                                  user="postgres",
                                  # пароль, который указали при установке PostgreSQL
                                  password="Pass2020!",
                                  host="127.0.0.1",
                                  port="5432")
    connection.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
    # Курсор для выполнения операций с базой данных
    cursor = connection.cursor()

    fake = Faker()

    for i in range(RECORDS):
        name = fake.company()
        country = fake.country().replace("\'", "")
        date = fake.date()
        web_site = "www." + name.replace(" ", "").replace(",", "") + ".com"
        is_official = randint(0, 1)
        parent_id = None
        if i > 0 and randint(0, 20):
            parent_id = randint(0, i)
        sql_insert = None
        if parent_id is None:
            sql_insert = f"""INSERT INTO bookmakers (pk, name, country, foundation_date,
                                 web_site, is_official) VALUES ({i}, \'{name}\', \'{country}\',
                                                   {date}, \'{web_site}\', {is_official});"""
        else:
            sql_insert = f"""INSERT INTO bookmakers (pk, name, country, foundation_date,
                                 web_site, is_official, parent_id) VALUES ({i}, \'{name}\', \'{country}\',
                                                   {date}, \'{web_site}\', {is_official}, {parent_id});"""
        cursor.execute(sql_insert)
        connection.commit()

except (Exception, Error) as error:
    print("Ошибка при работе с PostgreSQL", error)
