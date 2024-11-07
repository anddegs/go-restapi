# go-restapi

How to start
1. Start Postgres database via docker-compose.yml
    > docker compose up -d
2. Execute go mod tidy

3. To run the application
    > go run ./cmd/api 

* Application will run and you should see the following logs
    2024/11/07 14:08:28 Connected to Postgres!
    2024/11/07 14:08:28 Application listening  on port 8080

Application Dependency
1. github.com/go-chi/chi/v5 v5.1.0      -> go get github.com/go-chi/chi/v5      -> package for restapi http handler and routing
2. github.com/golang-jwt/jwt/v4 v4.5.0  -> go get github.com/golang-jwt/jwt/v4  -> package for jwt authentication token generation
3. github.com/jackc/pgx/v4 v4.18.3      -> go get github.com/jackc/pgx/v4       -> package for connecting to postgres database 


Design pattern implemented
1. Rest API
2. Respository design pattern
3. Authentication

Packaging to as docker image
1. execute ./build-docker.sh

To run the docker image
2. docker run -p 8080:8080 my-go-rest-api ./main -dsn="host=192.168.1.51 port=5432 user=postgres password=postgres dbname=movies sslmode=disable timezone=UTC connect_timeout=5"
 
