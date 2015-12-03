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

ENV APPSERVER websphere
ENV APPSERVER_VERSION websphere-8.5.5.0
ENV APPSERVER_CMD /bundles/$APPSERVER_VERSION/bin/profiles/liferay/bin/startServer.sh server1

ENV APPSERVER_FILE_1 7.1.0.0-WS-IBMWASJAVA-part1.zip
ENV APPSERVER_FILE_2 7.1.0.0-WS-IBMWASJAVA-part2.zip
ENV APPSERVER_FILE_3 8.5.5-WS-WAS-FP0000002-part1.zip
ENV APPSERVER_FILE_4 8.5.5-WS-WAS-FP0000002-part2.zip
ENV APPSERVER_FILE_5 agent.installer.linux.gtk.x86_64_1.8.3000.20150606_0047.zip
ENV APPSERVER_FILE_6 was.repo.8550.developers.ilan_part1.zip
ENV APPSERVER_FILE_7 was.repo.8550.developers.ilan_part2.zip
ENV APPSERVER_FILE_8 was.repo.8550.developers.ilan_part3.zip

RUN	mkdir /bundles \
	&& cd /bundles \
	&& curl -kLO "http://192.168.99.1:8080/portal-setup-wizard.properties" \
	&& curl -kLO "http://192.168.99.1:8080/$APPSERVER_VERSION/$APPSERVER_FILE_1" \
	&& curl -kLO "http://192.168.99.1:8080/$APPSERVER_VERSION/$APPSERVER_FILE_2" \
	&& curl -kLO "http://192.168.99.1:8080/$APPSERVER_VERSION/$APPSERVER_FILE_3" \
	&& curl -kLO "http://192.168.99.1:8080/$APPSERVER_VERSION/$APPSERVER_FILE_4" \
	&& curl -kLO "http://192.168.99.1:8080/$APPSERVER_VERSION/$APPSERVER_FILE_5" \
	&& curl -kLO "http://192.168.99.1:8080/$APPSERVER_VERSION/$APPSERVER_FILE_6" \
	&& curl -kLO "http://192.168.99.1:8080/$APPSERVER_VERSION/$APPSERVER_FILE_7" \
	&& curl -kLO "http://192.168.99.1:8080/$APPSERVER_VERSION/$APPSERVER_FILE_8" \
	&& curl -kL "$LIFERAY_DOWNLOAD_URL" -o liferay-portal.tar.gz \
	&& mkdir /liferay-portal \
	&& tar -xvzf liferay-portal.tar.gz -C /liferay-portal --strip-components=1 \
	&& rm liferay-portal.tar.gz \
	&& cd /liferay-portal \
	&& rm /bin/sh \
	&& ln -s /bin/bash /bin/sh \
	&& ant clean \
	&& ant compile \
	&& ant -f build-dist.xml build-dist-$APPSERVER_VERSION \
	&& cd / \
	&& rm -rf /tmp/* /var/tmp/* /liferay-portal /bundles/*.zip \
	&& rm /bin/sh \
    && ln -s /bin/dash /bin/sh

EXPOSE 8080

CMD $APPSERVER_CMD