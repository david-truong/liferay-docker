#!/bin/bash

docker run --volumes-from bundle-jboss --volumes-from data-hsdb -p 8080:8080 liferay-app
