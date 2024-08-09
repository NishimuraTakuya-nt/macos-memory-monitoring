.PHONY: $(MAKECMDGOALS)

# 環境変数の読み込み
ifneq (,$(wildcard ./.envrc))
    include .envrc
    export
endif

help: ## Display this help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

up: ## Start the containers
	docker compose up -d

down: ## Stop and remove the containers
	docker compose down

remove-volume: ## Remove the Docker volumes
	docker volume rm macos-memory-monitoring_influxdb-data macos-memory-monitoring_grafana-data

logs: ## View container logs
	docker compose logs -f

build: ## Rebuild the containers
	docker compose build --no-cache

reset: down remove-volume up ## Reset the entire setup

direnv-allow: ## Allow direnv for the current directory
	direnv allow

direnv-deny: ## Deny direnv for the current directory
	direnv deny

direnv-reload: ## Reload direnv
	direnv reload
