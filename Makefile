SHELL = /bin/sh
.ONESHELL:
.DEFAULT_GOAL: help

build: ## Realiza o build da imagem
	@docker compose build

start: ## Inicia todos os serviços
	@docker compose up --build -d
	@trap 'docker compose down' INT; \
	docker attach app; \
	docker compose down

bash: ## Inicia a execução de um terminal shell no container
	@docker compose run --rm app bash

clean: ## Limpa completamente serviços, imegem e volumes
	@docker compose down -v --rmi all

stop: ## Termina todos os serviços
	@docker compose down --rmi local --remove-orphans

status: ## Mostra o status dos serviços
	@docker compose ps

chacina: ## Realiza assassinato em massa dos containers
	@docker container prune -f; \
	if [ -z "$$(docker ps -q)" ]; then \
		echo "Docker containers already dead."; \
	else \
		docker kill $$(docker ps -q); \
		echo '\n'; \
		echo "All docker containers are dead now."; \
	fi

help:
	@awk 'BEGIN {FS = ":.*##"; printf "Usage: make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-25s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)