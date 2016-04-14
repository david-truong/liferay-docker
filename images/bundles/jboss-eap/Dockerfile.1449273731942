FROM java:7

RUN apt-get update && apt-get install -y --no-install-recommends \
		ant \
		curl \
		git \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

ENV ANT_OPTS "-Xms2048m -Xmx2048m -XX:MaxPermSize=512m"

ENV LIFERAY_COMMIT 29bd13e
ENV LIFERAY_DOWNLOAD_URL https://github.com/liferay/liferay-portal/archive/${LIFERAY_COMMIT}.tar.gz

ENV APPSERVER jboss-eap
ENV APPSERVER_VERSION jboss-eap-6.4.0
ENV APPSERVER_CMD /bundles/$APPSERVER_VERSION/bin/standalone.sh -b 0.0.0.0
ENV APPSERVER_FILE $APPSERVER_VERSION.zip

RUN	mkdir /bundles \
	&& cd /bundles \
	&& curl -kLO "http://192.168.99.1:8080/portal-setup-wizard.properties" \
	&& curl -kLO "http://192.168.99.1:8080/$APPSERVER_FILE" \
	&& curl -kL "$LIFERAY_DOWNLOAD_URL" -o liferay-portal.tar.gz \
	&& mkdir /liferay-portal \
	&& tar -xvzf liferay-portal.tar.gz -C /liferay-portal --strip-components=1 \
	&& rm liferay-portal.tar.gz \
	&& cd /liferay-portal \
	&& ant clean \
	&& ant compile \
	&& ant -f build-dist.xml build-dist-$APPSERVER-6.4 \
	&& cd / \
	&& rm -rf /tmp/* /var/tmp/* /liferay-portal /bundles/*.zip

EXPOSE 8080

CMD $APPSERVER_CMD