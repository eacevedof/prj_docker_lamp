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

restart-apache: ## restart apache
	docker-compose restart apache

docker-ps: ## show docker ps
	docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

start:  ## start container
	docker-compose start

stop:   ## stop it
	docker-compose stop
