up:
	docker-compose --file ./srcs/docker-compose.yml up  -d 
down:
	docker-compose  --file ./srcs/docker-compose.yml down

clean: down
	docker system prune -a 
re: clean up
