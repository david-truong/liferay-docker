FROM oracle-java7:latest

RUN apt-get update && apt-get install -y --no-install-recommends \
    ant \
    curl \
    git \
    gradle

ENV LIFERAY_COMMIT 9d34ae6
ENV LIFERAY_DOWNLOAD_URL https://github.com/liferay/liferay-portal/archive/${LIFERAY_COMMIT}.tar.gz

RUN curl -kL "$LIFERAY_DOWNLOAD_URL" -o liferay-portal.tar.gz \
	&& mkdir /liferay-portal \
	&& tar -xvzf liferay-portal.tar.gz -C /liferay-portal --strip-components=1 \
	&& rm liferay-portal.tar.gz

RUN mkdir bundles

COPY portal-setup-wizard.properties /bundles/portal-setup-wizard.properties

ENV ANT_OPTS "-Xmx2048m -XX:MaxPermSize=1024m"