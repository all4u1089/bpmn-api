#Build docker (create images)

sudo docker build --tag=clouvir-mariadb:1.0 mariadb/

sudo docker build --tag=clouvir-phpadmin:1.0 myphpadmin/

sudo docker build --tag=clouvir-server:1.0 server/

sudo docker build --tag=clouvir-nginx:1.0 nginx/

#Run docker (run containers)

# Run Mariadb server

1. sudo docker run -d --name=clouvir-mariadb -v /home/clouvirdata/mariadb:/var/lib/mysql -p 3306:3306 clouvir-mariadb:1.0

2. sudo docker exec -it clouvir-mariadb bash

3. mysql -u root < /home/mysql/dump/clouvir.sql

# Run Phpmyadmin

sudo docker run -d --name=clouvir-phpadmin --link clouvir-mariadb:clouvirdb -p 9000:80 clouvir-phpadmin:1.0

# Run Nginx

*Open the port on which docker daemon listens so the firewall does not block it

firewall-cmd --permanent --zone=trusted --add-interface=docker0

firewall-cmd --permanent --zone=trusted --add-port=4243/tcp


sudo docker run -d --name=clouvir-nginx -v /home/clouvirdata/file:/usr/share/nginx/media -p 8089:80 clouvir-nginx:1.0

# Run api server

sudo docker run --name=clouvir-server -v /home/clouvirdata/deploy:/usr/local/tomcat/webapps --link=clouvir-mariadb:clouvirdb -p 8088:8080 clouvir-server:1.0

## Deploy package

cp clouvir-api-1.0.0.war /home/clouvirdata/deploy/ROOT.war

3. sudo docker exec -it clouvir-server bash

#Start and stop (follow order)

sudo docker stop clouvir-server

sudo docker stop clouvir-mariadb

sudo docker stop clouvir-phpadmin

sudo docker start clouvir-mariadb

sudo docker start clouvir-phpadmin

sudo docker start clouvir-server