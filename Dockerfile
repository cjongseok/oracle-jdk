from ubuntu:14.04

ENV ORACLE_JDK_VERSION=1.7.0_79

# install dependencies
RUN set -ex \
        && apt-get update \
        && apt-get -y install wget curl build-essential \
        && apt-get -y install alien dpkg-dev debhelper \
        && apt-get -y install dnsutils


# install oracle jdk 8
RUN set -ex \
        && mkdir -p /usr/java \
        && cd /usr/java \
#&& curl -LO --insecure --junk-session-cookies --location --remote-name --silent --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u77-b03/jdk-8u77-linux-x64.tar.gz \
        && curl -LO --insecure --junk-session-cookies --location --remote-name --silent --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.tar.gz \
        && tar xvzf jdk-8u77-linux-x64.tar.gz

ENV JAVA_HOME=/usr/java/jdk${ORACLE_JDK_VERSION}
ENV PATH=${PATH}:${JAVA_HOME}/bin
