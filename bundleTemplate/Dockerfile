FROM java:7

ENV ANT_OPTS "-Xms2048m -Xmx2048m -XX:MaxPermSize=512m"

ENV APPSERVER jboss
ENV APPSERVER_VERSION jboss-eap-6.4

ENV LIFERAY_COMMIT 29bd13e
ENV LIFERAY_DOWNLOAD_URL https://github.com/liferay/liferay-portal/archive/${LIFERAY_COMMIT}.tar.gz

RUN mkdir bundles

COPY portal-setup-wizard.properties /bundles/
COPY $APPSERVER_ZIP /bundles/

RUN apt-get update && \
	apt-get install -y --no-install-recommends ant curl git && \
	curl -kL "$LIFERAY_DOWNLOAD_URL" -o liferay-portal.tar.gz && \
	mkdir /liferay-portal && \
	tar -xvzf liferay-portal.tar.gz -C /liferay-portal --strip-components=1 && \
	rm liferay-portal.tar.gz && \
	cd liferay-portal && \
	ant clean && \
	ant compile && \
	ant -f build-dist.xml build-dist-$APPSERVER_VERSION && \
	cd / && \
	apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /liferay-portal /bundles/*.zip

EXPOSE 8080

CMD /bundles/jboss-eap-6.4.0/bin/standalone.sh