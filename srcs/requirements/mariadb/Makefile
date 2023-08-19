mariadb_container = mamamia

mariadb: clean
	docker build -t mdb .
	docker run -d -p 3306:3306 --name $(mariadb_container) mdb
	docker ps
	docker logs $(mariadb_container)
	docker exec -it $(mariadb_container) bash
	
clean:
	@if (docker ps -a | grep $(mariadb_container)); then \
		docker stop $(mariadb_container); \
		docker rm $(mariadb_container); \
	fi
	@if docker images | grep mdb; then \
		docker rmi mdb; \
	fi
