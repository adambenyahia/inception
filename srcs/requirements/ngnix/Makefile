
nginx_container = test

nginx: clean_nginx
	docker build -t ng .
	docker run -d -p 443:443 --name test ng
	docker ps
	docker logs test
	docker exec -it test bash
	

clean_nginx:
	@if (docker ps -a | grep $(nginx_container)); then \
		docker stop $(nginx_container); \
		docker rm $(nginx_container); \
	fi
	@if docker images | grep ng; then \
		docker rmi ng; \
	fi
