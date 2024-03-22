run:
	mkdir -p /home/kyacini/data/wordpress
	mkdir -p /home/kyacini/data/mariadb
	docker-compose -f ./srcs/docker-compose.yml up -d --build

stop:
	docker-compose -f ./srcs/docker-compose.yml down -v
clean: stop
	docker system prune -af
	docker rm -f nginx mariadb wordpress

fclean: stop
	docker system prune -af
	sudo rm -rf /home/kyacini/data/wordpress/
	sudo rm -rf /home/kyacini/data/mariadb/

re: fclean run

.PHONY: run fclean stop re
