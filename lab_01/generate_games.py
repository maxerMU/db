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
        team1 = fake.city()
        team2 = fake.city()
        team1_goals = randint(0, 10)
        team2_goals = randint(0, 10)
        is_finished = randint(0, 1)
        sql_insert = f"""INSERT INTO games (pk, home_team_name, away_team_name,
                                            home_team_goals, away_team_goals, is_finished) 
                                 VALUES ({i}, \'{team1}\', \'{team2}\',
                                                   {team1_goals}, {team2_goals}, {is_finished});"""
        cursor.execute(sql_insert)
        connection.commit()

except (Exception, Error) as error:
    print("Ошибка при работе с PostgreSQL", error)
