FROM centos
MAINTAINER Jaime Meritt <jaime.meritt@gmail.com>
RUN rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch
ADD elasticsearch.repo /etc/yum.repos.d/elasticsearch.repo
RUN yum -y update && yum -y install java-1.8.0-openjdk-devel elasticsearch
RUN set -ex \
    && for path in \
       /usr/share/elasticsearch/data \
       /usr/share/elasticsearch/logs \
       /usr/share/elasticsearch/config \
       /usr/share/elasticsearch/config/scripts \
    ; do \
	mkdir -p "$path"; \
	chown -R elasticsearch:elasticsearch "$path"; \
    done
VOLUME /usr/share/elasticsearch/data

RUN chsh -s /bin/bash elasticsearch
COPY config /usr/share/elasticsearch/config
ENTRYPOINT su -c "/usr/share/elasticsearch/bin/elasticsearch" - elasticsearch

EXPOSE 9200 9300