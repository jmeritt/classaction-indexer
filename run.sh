#!/bin/sh
docker kill elastic
docker rm elastic
docker run -d -p 9200:9200 -p 9300:9300 --name elastic jmeritt/elastic
docker kill logstash
docker rm logstash
docker run -d --name logstash --link elastic:elastic -v ~/Development/fmm/classaction-indexer/logstash/rss.conf:/rss.conf jmeritt/logstash
