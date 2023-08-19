up:
	docker-compose --file ./srcs/docker-compose.yml up  -d 
down:
	docker-compose  --file ./srcs/docker-compose.yml down

clean: down
	docker rmi -f $$(docker images -q)
	docker volume prune -f 
	# docker system prune -a --volumes
re: clean up
