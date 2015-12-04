FROM java:7

RUN apt-get update && apt-get install -y --no-install-recommends \
		ant \
		curl \
		git \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

ENV ANT_OPTS "-Xms2048m -Xmx2048m -XX:MaxPermSize=512m"

ENV LIFERAY_COMMIT %LIFERAY_COMMIT%
ENV LIFERAY_DOWNLOAD_URL https://github.com/liferay/liferay-portal/archive/${LIFERAY_COMMIT}.tar.gz

ENV APPSERVER %APPSERVER%
ENV APPSERVER_VERSION %APPSERVER%-%APPSERVER_VERSION%
ENV APPSERVER_CMD %APPSERVER_CMD%
%FILES%

RUN	mkdir /bundles \
	&& cd /bundles \
	&& curl -kLO "http://192.168.99.1:8080/portal-setup-wizard.properties" \
	%CURL_FILES%
	&& curl -kL "$LIFERAY_DOWNLOAD_URL" -o liferay-portal.tar.gz \
	&& mkdir /liferay-portal \
	&& tar -xvzf liferay-portal.tar.gz -C /liferay-portal --strip-components=1 \
	&& rm liferay-portal.tar.gz \
	&& cd /liferay-portal \
	&& ant clean \
	&& ant compile \
	&& ant -f build-dist.xml build-dist-%DIST_COMMAND% \
	&& cd / \
	&& rm -rf /tmp/* /var/tmp/* /liferay-portal /bundles/*.zip

EXPOSE 8080

CMD $APPSERVER_CMD