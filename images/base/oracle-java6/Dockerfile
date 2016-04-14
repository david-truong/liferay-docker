# Pull base image.
FROM ubuntu-debootstrap:trusty

# Install Java.
RUN apt-get update && \
	apt-get install -y --no-install-recommends software-properties-common && \
	echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
	add-apt-repository -y ppa:webupd8team/java && \
	apt-get update && \
	apt-get install -y oracle-java6-installer && \
	rm -rf /var/lib/apt/lists/* && \
	rm -rf /var/cache/oracle-jdk6-installer

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-6-oracle

# Define default command.
CMD ["bash"]
