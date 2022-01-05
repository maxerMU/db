import psycopg2

connection = psycopg2.connect(database="betsdb",
                              user="postgres",
                              # пароль, который указали при установке PostgreSQL
                              password="Pass2020!",
                              host="127.0.0.1",
                              port="5432")

def print_cur(cur):
    rows = cur.fetchall()
    for row in rows:
        for col in row:
            print(col, end=" ")
        print("\n", end="")

def scalar_01():
    cur = connection.cursor()
    cur.execute('''
            select count(*) from bookmakers;
        ''')
    print_cur(cur)
    
    cur.close()

def join_02():
    cur = connection.cursor()
    cur.execute('''
            SELECT name, surname, AVG(bet.price) as AvgPrediction
            FROM customers c JOIN bets bet on c.pk = bet.fk_customer
            WHERE country='Brazil'
            GROUP BY name, surname;
        ''')
    print_cur(cur)
    
    cur.close()

def cte_03():
    cur = connection.cursor()
    cur.execute('''
            with CTE(bookmaker_country, bookmakers_count) AS (
            SELECT country, COUNT(*) as Total
            FROM bookmakers
            GROUP BY country
            )
            SELECT bookmaker_country, count(bookmakers_count) as AvgBookmakersInCountry
            FROM CTE;
        ''')
    print_cur(cur)
    
    cur.close()

def metadata_04():
    db_name = input("Input db name: ")
    cur = connection.cursor()
    cur.execute(f'''
            SELECT oid, datconnlimit
            FROM pg_database
            WHERE datname = '{db_name}';
        ''')
    print_cur(cur)
    
    cur.close()

def scalar_func_05():
    game_id = int(input("Input game id: "))
    cur = connection.cursor()
    cur.execute(f'''
            SELECT get_game_total_price({game_id});
        ''')
    print_cur(cur)
    
    cur.close()

def table_func_06():
    cur = connection.cursor()
    cur.execute(f'''
            SELECT * FROM get_official_bookmakers();
        ''')
    print_cur(cur)
    
    cur.close()

def procedure_07():
    game_id = int(input("Input game id: "))
    cur = connection.cursor()
    cur.execute(f'''
            CALL bets_paid({game_id});
        ''')
    # print_cur(cur)

    cur.execute(f'''
            SELECT state from bets WHERE fk_game={game_id};
        ''')
    print_cur(cur)
    connection.commit()
    
    cur.close()

def system_08():
    cur = connection.cursor()
    cur.callproc('current_database', [])

    print_cur(cur)
    
    cur.close()

def create_table_09():
    cur = connection.cursor()
    cur.execute(f'''
            CREATE table IF NOT EXISTS player_info_1 (
                pk int,
                name text,
                surname text,
                team text
            );
        ''')

    connection.commit()
    
    cur.close()

def insert_10():
    pk = int(input("input primary key: "))
    name = input("input player name: ")
    surname = input("input player surname: ")
    team = input("input team name: ")
    cur = connection.cursor()
    cur.execute(f'''
            insert into player_info_1(pk, name, surname, team)
            values ({pk}, '{name}', '{surname}', '{team}');
        ''')
    
    connection.commit()

    cur.execute(f'''
            select * from player_info_1 where pk={pk};
        ''')
    print_cur(cur)

    cur.close()

def print_menu():
    print("0: Scalar query\n"
          "1: join query\n"
          "2: cte query\n"
          "3: metadata query\n"
          "4: scalar func query\n"
          "5: table func query\n"
          "6: procedure query\n"
          "7: system func\n"
          "8: create table\n"
          "9: insert into table\n"
          "10+: exit"
         )

def main():
    functions = [scalar_01, join_02, cte_03, metadata_04, scalar_func_05, table_func_06, procedure_07, system_08, create_table_09, insert_10]
    while True:
        print_menu()
        choise = int(input("> "))
        if (choise >= len(functions) or choise < 0):
            break

        functions[choise]()


if __name__ == "__main__":
    main()