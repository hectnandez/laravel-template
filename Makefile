compose_file=docker-compose.yml
s?=app

.PHONY: up
up:
	docker compose up -d

.PHONY: down
down:
	docker compose down

.PHONY: shell
shell:
	docker compose exec -it $(s) /bin/bash

.PHONY: build
build:
	docker compose -f $(compose_file) build --no-cache app supervisor
