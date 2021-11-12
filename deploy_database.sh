psql "sslmode=disable user=postgres hostaddr=127.0.0.1 port=5432 password=Pass2020!" < ./lab_01/queries/create_database.sql

psql "sslmode=disable user=postgres hostaddr=127.0.0.1 port=5432 password=Pass2020!" < ./lab_01/queries/create_user.sql
