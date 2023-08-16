
wordpress_container = word

nginx: clean
	docker build -t wordpress .
	docker run -d -p 9000:9000 --name $(wordpress_container) wordpress
	docker ps
	docker logs $(wordpress_container)
	docker exec -it $(wordpress_container) bash
	

clean:
	@if (docker ps -a | grep $(wordpress_container)); then \
		docker stop $(wordpress_container); \
		docker rm $(wordpress_container); \
	fi
	@if docker images | grep wordpress; then \
		docker rmi wordpress; \
	fi