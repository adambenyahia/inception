
up:
	@./env_setup.sh
	@mkdir -p ~/data/wordpress
	@mkdir -p ~/data/mariadb
	@docker-compose --file ./srcs/docker-compose.yml up  -d

stop:
	docker-compose --file ./srcs/docker-compose.yml stop

down:
	docker-compose  --file ./srcs/docker-compose.yml down --rmi all 

clean: down
	docker rmi -f $$(docker images -q)
	docker volume prune -f 
	
prune: clean
	docker system prune -a --volumes -f

re: clean up 

flush: 
	rm -rf ~/data/


.PHONY: up down clean re flush

