FROM liferay/bundle-base:latest

ENV ANT_OPTS "-Xms2048m -Xmx2048m -XX:MaxPermSize=512m"

ENV APPSERVER websphere
ENV APPSERVER_VERSION websphere-8.5.5.0

COPY *.zip /bundles/

RUN	mkdir /liferay-portal && \
	tar -xvzf liferay-portal.tar.gz -C /liferay-portal --strip-components=1 && \
	rm liferay-portal.tar.gz && \
	cd liferay-portal && \
	ant clean && \
	ant compile && \
	rm /bin/sh && \
	ln -s /bin/bash /bin/sh && \
    ant -f build-dist.xml build-dist-$APPSERVER && \
	rm -rf /liferay-portal /bundles/*.zip && \
	rm /bin/sh && \
    ln -s /bin/dash /bin/sh

EXPOSE 8080

CMD /bundles/$APPSERVER_VERSION/bin/profiles/liferay/bin/startServer.sh server1