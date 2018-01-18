.PHONY: build run stop clean restart rebuild

build:
	@docker-compose build --no-cache

run:
	@docker-compose up -d

stop:
	@docker-compose stop

restart: stop run

clean: stop
	@docker-compose rm -f

rebuild: clean build run


