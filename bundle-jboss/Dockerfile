FROM java:7

RUN apt-get update && apt-get install -y --no-install-recommends \
		ant \
		curl \
		git \
		net-tools \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

ENV ANT_OPTS "-Xms2048m -Xmx2048m -XX:MaxPermSize=512m"

ENV APPSERVER jboss
ENV APPSERVER_VERSION jboss-eap-6.4

ENV LIFERAY_COMMIT 29bd13e
ENV LIFERAY_DOWNLOAD_URL https://github.com/liferay/liferay-portal/archive/${LIFERAY_COMMIT}.tar.gz

#COPY portal-setup-wizard.properties /bundles/
#COPY *.zip /bundles/
#

RUN HOST=$(netstat -nr | grep '^0\.0\.0\.0' | awk '{print $2}') \
	&& mkdir /bundles \
	&& cd /bundles \
	&& curl -kL "http://$HOST:60608" \
#	&& ls
##	&& curl -kL "$LIFERAY_DOWNLOAD_URL" -o liferay-portal.tar.gz \
#	&& mkdir /liferay-portal \
#	&& tar -xvzf liferay-portal.tar.gz -C /liferay-portal --strip-components=1 \
#	&& rm liferay-portal.tar.gz \
#	&& cd liferay-portal \
#	&& ant clean \
#	&& ant compile \
#	&& ant -f build-dist.xml build-dist-$APPSERVER_VERSION \
#	&& cd / \
#	&& rm -rf /tmp/* /var/tmp/* /liferay-portal /bundles/*.zip
#
#EXPOSE 8080
#
#CMD /bundles/jboss-eap-6.4.0/bin/standalone.sh