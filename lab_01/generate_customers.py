import psycopg2
from psycopg2 import Error
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT
from faker import Faker

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
        name = fake.first_name()
        surname = fake.last_name()
        phone_number = f"{fake.country_calling_code()}{fake.msisdn()[3:]}"
        country = fake.country().replace("\'", "")
        sql_insert = f"""INSERT INTO customers (pk, name, surname, phone_number,
                                 country) VALUES ({i}, \'{name}\', \'{surname}\',
                                                   \'{phone_number}\', \'{country}\');"""
        cursor.execute(sql_insert)
        connection.commit()

except (Exception, Error) as error:
    print("Ошибка при работе с PostgreSQL", error)
