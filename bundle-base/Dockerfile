FROM java:7

RUN apt-get update && apt-get install -y --no-install-recommends ant curl git && \
	apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir bundles

COPY portal-setup-wizard.properties /bundles/

ENV ANT_OPTS "-Xms2048m -Xmx2048m -XX:MaxPermSize=512m"

ENV LIFERAY_COMMIT 29bd13e
ENV LIFERAY_DOWNLOAD_URL https://github.com/liferay/liferay-portal/archive/${LIFERAY_COMMIT}.tar.gz

RUN curl -kL "$LIFERAY_DOWNLOAD_URL" -o liferay-portal.tar.gz \
	&& mkdir /liferay-portal \
	&& tar -xvzf liferay-portal.tar.gz -C /liferay-portal --strip-components=1 \
	&& rm liferay-portal.tar.gz

WORKDIR /liferay-portal

RUN ant clean && \
	ant compile