FROM centos
MAINTAINER Jaime Meritt <jaime.meritt@gmail.com>
RUN rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch
ADD logstash.repo /etc/yum.repos.d/logstash.repo
RUN yum -y update && yum -y install java-1.8.0-openjdk-devel logstash
RUN /opt/logstash/bin/plugin install logstash-input-http_poller
ADD rss.conf /rss.conf
ENTRYPOINT /opt/logstash/bin/logstash -f rss.conf
