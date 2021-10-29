import psycopg2
from psycopg2 import Error
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT
from faker import Faker
from random import randint, uniform

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
        prediction = randint(0, 2)
        state = randint(0, 1)
        coefficient = uniform(0.5, 3.5)
        price = randint(100, 5000)
        sql_insert = f"""INSERT INTO bets (fk_bookmaker, fk_game, fk_customer,
                                            customer_prediction, coefficient, price, state) 
                                 VALUES ({i}, {RECORDS - i - 1}, {i},
                                                   {prediction}, {coefficient:.3}, {price}, {state});"""
        cursor.execute(sql_insert)
        connection.commit()

except (Exception, Error) as error:
    print("Ошибка при работе с PostgreSQL", error)
