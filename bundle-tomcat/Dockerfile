FROM java:7

RUN apt-get update && apt-get install -y --no-install-recommends \
		ant \
		curl \
		git \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

ENV ANT_OPTS "-Xms2048m -Xmx2048m -XX:MaxPermSize=512m"

ENV APPSERVER tomcat
ENV APPSERVER_VERSION tomcat-7.0.62

ENV LIFERAY_COMMIT 29bd13e
ENV LIFERAY_DOWNLOAD_URL https://github.com/liferay/liferay-portal/archive/${LIFERAY_COMMIT}.tar.gz

COPY portal-setup-wizard.properties /bundles/
COPY *.zip /bundles/

RUN	curl -kL "$LIFERAY_DOWNLOAD_URL" -o liferay-portal.tar.gz \
	&& mkdir /liferay-portal \
	&& tar -xvzf liferay-portal.tar.gz -C /liferay-portal --strip-components=1 \
	&& rm liferay-portal.tar.gz \
	&& cd liferay-portal \
	&& ant clean \
	&& ant compile \
	&& ant -f build-dist.xml build-dist-$APPSERVER \
	&& cd / \
	&& rm -rf /tmp/* /var/tmp/* /liferay-portal /bundles/*.zip

ENV CATALINA_HOME /bundles/$APPSERVER_VERSION
ENV PATH $CATALINA_HOME/bin:$PATH

EXPOSE 8080

CMD ["catalina.sh", "run"]