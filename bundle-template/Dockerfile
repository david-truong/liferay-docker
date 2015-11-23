FROM oracle-java7:latest

RUN apt-get update && apt-get install -y --no-install-recommends \
    ant \
    curl \
    git

ENV LIFERAY_COMMIT f87e111
ENV LIFERAY_DOWNLOAD_URL https://github.com/liferay/liferay-portal/archive/${LIFERAY_COMMIT}.tar.gz

RUN curl -kL "$LIFERAY_DOWNLOAD_URL" -o liferay-portal.tar.gz \
	&& mkdir /liferay-portal \
	&& tar -xvzf liferay-portal.tar.gz -C /liferay-portal --strip-components=1 \
	&& rm liferay-portal.tar.gz

RUN mkdir bundles

ENV ANT_OPTS "-Xmx1048m -XX:MaxPermSize=512m"

WORKDIR /liferay-portal

RUN ant clean && \
	ant compile