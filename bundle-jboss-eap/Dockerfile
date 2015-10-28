FROM liferay-bundle-template:latest

COPY app.server.root.properties /liferay-portal/app.server.root.properties

COPY startup.sh /bundles/startup.sh

RUN chmod a+x /bundles/startup.sh

WORKDIR /liferay-portal

RUN ant clean && \
	ant compile && \
	ant -f build-dist.xml build-dist-jboss-eap-6.4 && \
	rm -rf /liferay-portal

VOLUME /bundles