FROM liferay/bundle-base:latest

ENV ANT_OPTS "-Xms2048m -Xmx2048m -XX:MaxPermSize=512m"

ENV APPSERVER tomcat
ENV APPSERVER_VERSION tomcat-7.0.62
ENV APPSERVER_ZIP apache-tomcat-7.0.62.zip

COPY $APPSERVER_ZIP /bundles/

RUN	ant -f build-dist.xml build-dist-$APPSERVER && \
	rm -rf /liferay-portal /bundles/$APPSERVER_ZIP

ENV CATALINA_HOME /bundles/$APPSERVER_VERSION
ENV PATH $CATALINA_HOME/bin:$PATH

EXPOSE 8080

CMD ["catalina.sh", "run"]