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
#5275 3478 3478/udp 4443/udp
#EXPOSE 10000/udp 10001/udp 10002/udp 10003/udp 10004/udp 10005/udp 10006/udp 10007/udp 10008/udp 10009/udp 10010/udp
EXPOSE 10000-10020/udp
# 10000-20000/tcp

COPY configure.sh /configure.sh
#CMD /configure.sh

COPY run.sh /run.sh
CMD /run.sh
