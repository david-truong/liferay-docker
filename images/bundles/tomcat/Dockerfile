FROM java:7

RUN apt-get update && apt-get install -y --no-install-recommends ant curl && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV ANT_OPTS '-Xms3072m -Xmx3072m -XX:MaxPermSize=786m'

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

RUN mkdir /bundles && cd /bundles && curl -kLO 'http://192.168.99.1:8080/portal-setup-wizard.properties' && curl -kLO 'http://192.168.99.1:8080/tomcat-7.0.62/apache-tomcat-7.0.62.zip' && curl -kLO 'http://192.168.99.1:8080/liferay-portal-master.tar.gz' && mkdir /liferay-portal && tar -xvzf liferay-portal-master.tar.gz -C /liferay-portal --strip-components=1 && rm liferay-portal-master.tar.gz && cd /liferay-portal && ant clean && ant compile && ant -f build-dist.xml build-dist-tomcat && cd / && rm -rf /tmp/* /var/tmp/* /liferay-portal /bundles/*.zip

VOLUME /bundles/data

EXPOSE 8080

CMD /bundles/tomcat-7.0.62/bin/catalina.sh run

