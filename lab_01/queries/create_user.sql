CREATE USER maxermu WITH ENCRYPTED PASSWORD '1234';

GRANT ALL PRIVILEGES ON DATABASE betsdb TO maxermu;
GRANT pg_read_server_files TO maxermu;
