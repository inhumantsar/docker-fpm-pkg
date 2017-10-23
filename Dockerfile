FROM alpine
MAINTAINER Shaun Martin <shaun@samsite.ca>

RUN apk --no-cache add \
      alpine-sdk \
      g++ \
      libffi-dev \
      make \
      rpm \
      ruby \
      ruby-dev \
      ruby-irb \
      ruby-rdoc \
    && gem install fpm

CMD ["/usr/local/bundle/bin/fpm", "--help"]
