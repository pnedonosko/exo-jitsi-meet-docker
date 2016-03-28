# Based on https://github.com/robertoandrade/docker-jitsi-meet but customized to use Ubuntu 14.04, Java 8 and eXo styles.
FROM ubuntu:14.04
MAINTAINER Peter Nedonosko <pnedonosko@exoplatform.com>
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

RUN apt-get update && \
	apt-get dist-upgrade -y && \
	apt-get install -y wget dnsutils mc && \
	echo 'deb http://download.jitsi.org/nightly/deb unstable/' >> /etc/apt/sources.list && \
	wget -qO - https://download.jitsi.org/nightly/deb/unstable/archive.key | apt-key add - && \
	apt-get update && \
	apt-get -y install jitsi-meet && \
	apt-get install -y software-properties-common python-software-properties && \
	add-apt-repository -y ppa:openjdk-r/ppa && \
	apt-get update && \
	apt-get install -y openjdk-8-jdk && \
	update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java && \
	update-alternatives --set javac /usr/lib/jvm/java-8-openjdk-amd64/bin/javac && \
	apt-get clean

EXPOSE 80 443 4443 5347
EXPOSE 10000-10020/udp

# UI customization
COPY src/interface_config.js /usr/share/exoplatform/jitsi-meet/
COPY src/images /usr/share/exoplatform/jitsi-meet/images/

# Config custmization
COPY configure.sh /configure.sh

# Run script
COPY run.sh /run.sh
CMD /run.sh
