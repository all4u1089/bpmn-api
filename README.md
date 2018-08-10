# CLOURVIR - API

## Server Info

Server Dev: http://projects.greenglobal.vn:6782/clouvir-api/

Server Test: http://test-api-clouvir.greenglobal.vn:9082

Server Demo: http://demo-api-clouvir.greenglobal.vn:9083

Server Staging:

Server Live:

## Setup development environment

* [JDK 1.8+](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
* [Maven 3.0+](https://maven.apache.org/download.cgi)
* [Eclipse for java EE IDE](https://www.eclipse.org/downloads/)
* [Docker](https://docs.docker.com/engine/getstarted/step_one/)

### Build Docker Images
Make sure you are in `docke` directory. Do following command for building docker images

1\. MariaDB
```
sudo docker build --tag=clouvir-mariadb:1.0 mariadb/
```

### Running and stopping the container images

1\. Run MariaDB container first

```
sudo docker run -d --name=clouvir-mariadb -p 4306:3306 clouvir-mariadb:1.0
```

Docker allows us to restart a container with a single command:

```
docker restart clouvir-mariadb

docker start clouvir-mariadb

docker stop clouvir-mariadb
```

To destroy a container, perhaps because the image does not suit our needs, we can stop it and then run
```
docker rm clouvir-mariadb
```

To access the container via Bash, we will run this command:

```
docker exec -it clouvir-mariadb bash
```

To connect to MariaDB from outside (HeidiSQl/MySql Workbench) we use port which define in the docker run command, here is **4306** (*-p 4306:3306*)

### Contribution guidelines ###

* Writing tests
* Code review
* Other guidelines

	- mvn spring-boot:run -Drun.profiles=dev

### Who do I talk to? ###

* Repo owner or admin
* Other community or team contact
