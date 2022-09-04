up:
	docker run --name simple_bank_db_1 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -p 5436:5432 -d postgres:10.5

down:
	docker stop simple_bank_db_1
	docker container rm simple_bank_db_1

db-mig-up:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5436/simple_bank?sslmode=disable" -verbose up

db-mig-down:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5436/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate