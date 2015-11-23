#!/bin/bash

#docker run --name liferay-mysql --volumes-from data-mysql -e MYSQL_ROOT_PASSWORD=root -d mysql:latest

docker run --volumes-from tomcat --volumes-from data-mysql -p 8080:8080 liferay-app