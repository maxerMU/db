# db

# start database
```
sudo docker run -d \
                --name dev-postgres \
                -e POSTGRES_PASSWORD=Pass2020! \
                -v {$HOME}/postgres_data/:/var/lib/postgresql/data \
                -p 5432:5432 \
                postgres

bash deploy_database.sh
```
