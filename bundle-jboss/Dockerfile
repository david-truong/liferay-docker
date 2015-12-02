FROM liferay/bundle-base:latest

ENV ANT_OPTS "-Xms2048m -Xmx2048m -XX:MaxPermSize=512m"

ENV APPSERVER jboss
ENV APPSERVER_VERSION jboss-eap-6.4
ENV APPSERVER_ZIP jboss-eap-6.4.0.zip

COPY $APPSERVER_ZIP /bundles/

RUN	ant -f build-dist.xml build-dist-$APPSERVER_VERSION && \
	rm -rf /liferay-portal /bundles/$APPSERVER_ZIP

EXPOSE 8080

CMD /bundles/jboss-eap-6.4.0/bin/standalone.sh