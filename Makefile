compose-setup:
	docker compose run --rm app make setup

compose-test:
	docker compose -f docker-compose.yml up --build --abort-on-container-exit --exit-code-from app

compose-dev:
	docker compose up

ci:
	docker compose -f docker-compose.yml build app
	docker compose -f docker-compose.yml run --rm app make setup
	docker compose -f docker-compose.yml up --abort-on-container-exit --exit-code-from app

setup:
	npm ci || npm install

test: setup
	NODE_ENV=test npm test -s