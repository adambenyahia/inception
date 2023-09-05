
up:
	@mkdir -p srcs/Data/wordpress
	@mkdir -p srcs/Data/mariadb
	docker-compose --file ./srcs/docker-compose.yml up  -d

stop:
	docker-compose --file ./srcs/docker-compose.yml stop

down:
	docker-compose  --file ./srcs/docker-compose.yml down

clean: down
	docker rmi -f $$(docker images -q)
	docker volume prune -f 
	# docker system prune -a --volumes -f
re: clean up 

flush:
	rm -rf srcs/Data
	$(MAKE) re

.PHONY: up down clean re flush

