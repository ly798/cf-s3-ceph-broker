FROM ruby:2.2.6-alpine

RUN apk update && \
    apk add git gcc g++ make linux-headers && \
    cd / && \
    git clone https://github.com/ly798/cf-s3-ceph-broker.git && \
    cd cf-s3-ceph-broker && \
    git checkout devlop && \
    gem install eventmachine && \
    gem install raindrops && \
    bundle install --without development test && \
    apk del git make linux-headers

WORKDIR /cf-s3-ceph-broker

CMD ["sh", "./entrypoint.sh"]

EXPOSE 9292
