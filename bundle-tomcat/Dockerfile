FROM liferay/bundle-base:latest

ENV APPSERVER tomcat
ENV APPSERVER_VERSION tomcat-7.0.62
ENV ANT_OPTS "-Xmx2048m"

RUN echo 'app.server.type='$APPSERVER > app.server.root.properties

COPY *.zip /bundles/
COPY startup.sh /bundles/scripts/startup.sh
RUN chmod a+x /bundles/scripts/startup.sh

VOLUME /bundles/scripts/

RUN	ant -f build-dist.xml build-dist-$APPSERVER && \
	rm -rf /liferay-portal

VOLUME /bundles/$APPSERVER_VERSION

VOLUME /bundles/osgi

EXPOSE 8080

CMD /bundles/scripts/startup.sh