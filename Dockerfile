FROM centos:7

MAINTAINER "Oli Schacher" <oli@wgwh.ch>

ENV OC_VERSION "v3.11.0"
ENV OC_RELEASE "openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit"

RUN yum install -y \
 git \
 curl \
 socat \
 which \
 mariadb \
 iproute2 \
 net-tools \
 bind-utils \
 epel-release \
 ca-certificates \ 
 && yum install swaks \
 && yum clean all

# openshift/kubernetes client
RUN curl -L https://github.com/openshift/origin/releases/download/$OC_VERSION/$OC_RELEASE.tar.gz | tar -C /usr/local/bin -xzf - --strip-components=1
