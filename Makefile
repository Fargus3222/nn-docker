docker_build:
		docker build . -t fargus3222/nnd:latest

docker_push:
	docker tag fargus3222/nnd:latest fargus3222/nnd:$(shell git log -1 --format=%s)
	docker push fargus3222/nnd:$(shell git log -1 --format=%s)
	docker push fargus3222/nnd:latest
		

init:
		docker compose up -d --build

down:
		docker compose down