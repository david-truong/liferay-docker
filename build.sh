#!/bin/bash

docker build -t liferay-bundle-template ./bundle-template/
docker build -t liferay-bundle-tomcat ./bundle-tomcat/
docker build -t liferay-bundle-jboss ./bundle-jboss/

docker build -t liferay-data-hsdb ./data-hsdb/
docker build -t liferay-data-mysql ./data-mysql/

docker build -t liferay-app ./app/