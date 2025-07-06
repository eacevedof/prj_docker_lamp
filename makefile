#!/bin/bash
TODAY := $(shell date +'%Y-%m-%d')
CURRENT_BRANCH := $(shell git rev-parse --abbrev-ref HEAD)

help: ## Show this help message
	@echo "usage: make [target]"
	@echo
	@echo "targets:"
	@egrep "^(.+)\:\ ##\ (.+)" ${MAKEFILE_LIST} | column -t -c 2 -s ":#"

gitpush: ## git push m=any message
	clear;
	git add .; git commit -m "$(m)"; git push;

rebuild-all: ## rebuild all containers
	clear
	docker-compose down
	docker-compose -f docker-compose.yml up -d --build --remove-orphans
	@docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

rebuild-apache: ## rebuild apache container
	clear
	docker-compose build apache
	docker-compose up --no-deps -d apache
	@docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

rebuild-spark: ## rebuild spark container
	clear
	docker-compose build spark
	docker-compose up --no-deps -d spark
	@docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

rebuild-php74: ## rebuild php-fpm-7.4
	clear
	docker-compose up -d --build php-fpm-7.4
	@docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

rebuild-php83: ## rebuild php-fpm-8.3
	clear
	docker-compose up -d --build php-fpm-8.3
	@docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

rebuild-deno: ## rebuild ubuntu-deno
	clear
	docker-compose up -d --build ubuntu-deno
	@docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

rebuild-zookeeper: ## zookeeper
	clear
	docker-compose up -d --build zookeeper
	@docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

rebuild-kafka: ## kafka
	clear
	docker-compose up -d --build kafka
	@docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

rebuild-debezium: ## debezium
	clear
	docker-compose up -d --build debezium
	@docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"


rebuild-py: ## rebuild py-3.10
	clear
	docker-compose up -d --build py-3.10
	@docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

destroy-all: ## destroy container and image
	docker-compose down --rmi all

ssh-apache: ## connect to container cont-lr-apache
	docker exec -it --user root cont-lr-apache bash

ssh-php74: ## connect to container cont-php-fpm-7.4
	docker exec -it --user root cont-php-fpm-7.4 bash

ssh-php83: ## connect to container cont-php-fpm-8.3
	docker exec -it --user root cont-php-fpm-8.3 bash

ssh-mysql: ## connect to container
	docker exec -it --user root cont-lr-mysql bash

ssh-debezium: ## connect to container
	docker exec -it --user root debezium sh

ssh-spark: ## connect to container
	docker exec -it --user root cont-lr-spark bash

ssh-pg: ## connect to container
	docker exec -it --user root cont-db-postgres bash

ssh-deno: ## connect to deno container
	docker exec -it --user root cont-ubuntu-deno bash

ssh-py310: ## connect to container cont-py-3.10
	docker exec -it --user root cont-py-3.10 bash

restart-apache: ## restart apache
	docker-compose restart apache

docker-ps: ## show docker ps
	docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

start:  ## start container
	docker-compose start

stop:   ## stop it
	docker-compose stop
