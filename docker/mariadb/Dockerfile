FROM mariadb:10.1.21

ENV MYSQL_ROOT_PASSWORD 123456
ENV MYSQL_DATABASE clouvir
ENV MYSQL_USER clouvir
ENV MYSQL_PASSWORD 123456

COPY dump.sql.gz /docker-entrypoint-initdb.d/dump.sql.gz