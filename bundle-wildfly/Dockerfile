FROM liferay/bundle-base:latest

ENV ANT_OPTS "-Xms2048m -Xmx2048m -XX:MaxPermSize=512m"

ENV APPSERVER wildfly
ENV APPSERVER_VERSION wildfly-9.0.1
ENV APPSERVER_ZIP wildfly-9.0.1.Final.zip

COPY $APPSERVER_ZIP /bundles/

RUN	ant -f build-dist.xml build-dist-$APPSERVER && \
	rm -rf /liferay-portal /bundles/$APPSERVER_ZIP

EXPOSE 8080

CMD /bundles/$APPSERVER_VERSION/bin/standalone.sh