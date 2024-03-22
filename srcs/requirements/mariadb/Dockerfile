FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y mariadb-server
RUN apt-get install -y mariadb-client

RUN	mkdir -p /run/mysqld && chown mysql:root /run/mysqld

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tool/script.sh ./script.sh

EXPOSE		3306

ENTRYPOINT [ "bash", "./script.sh" ]

CMD [ "mysqld_safe" ]
