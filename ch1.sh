set -eu

docker network create net01

docker run --network "net01" -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=contA-iner31a" -p 1433:1433 --name sql1 -d mcr.microsoft.com/mssql/server:2017-latest

sleep 20

docker exec -it sql1 /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 'contA-iner31a' -Q "CREATE DATABASE mydrivingDB"

docker run -it --network "net01" -e SQLFQDN=sql1 -e SQLUSER=sa -e "SQLPASS=contA-iner31a" -e SQLDB=mydrivingDB openhack/data-load:v1

docker build -t poi -f dockerfiles/Dockerfile_3 src/poi/ 

docker run -d -p 8080:80 --network "net01" --name poi -e "SQL_USER=SA" -e "SQL_PASSWORD=contA-iner31a" -e "SQL_SERVER=sql1" -e "ASPNETCORE_ENVIRONMENT=Local" poi

sleep 5

curl http://localhost:8080/api/poi