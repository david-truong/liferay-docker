#!/bin/bash

docker run --name data-hsdb liferay-data-hsdb:latest
docker run --name bundle-tomcat liferay-bundle-tomcat:latest

docker run --volumes-from bundle-tomcat --volumes-from data-hsdb -p 8080:8080 liferay-app