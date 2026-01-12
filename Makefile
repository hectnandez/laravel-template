compose_file=docker-compose.yml

.PHONY: up
up:
	docker compose up --build -d

.PHONY: down
down:
	docker compose down

.PHONY: composer-install
composer-update:
	docker-compose -f $(compose_file) run --rm app sh -c 'composer install'

.PHONY: composer-update
composer-update:
	docker-compose -f $(compose_file) run --rm app sh -c 'composer update'
