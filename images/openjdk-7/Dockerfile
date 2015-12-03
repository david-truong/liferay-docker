FROM java:7

MAINTAINER David Truong "david.truong@liferay.com"

RUN apt-get update && apt-get install -y --no-install-recommends \
		ant \
		curl \
		git \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*