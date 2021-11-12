psql "sslmode=disable dbname=betsdb user=postgres hostaddr=127.0.0.1 port=5432 password=Pass2020!" < ./lab_01/queries/create_tables.sql

python3 ./lab_01/generate_bookmakers.py
python3 ./lab_01/generate_games.py
python3 ./lab_01/generate_customers.py
python3 ./lab_01/generate_bets.py

for file in ./lab_03/*;
    do psql "sslmode=disable dbname=betsdb user=postgres hostaddr=127.0.0.1 port=5432 password=Pass2020!" <  $file;
done
