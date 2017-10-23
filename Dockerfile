FROM ruby:alpine
MAINTAINER Shaun Martin <shaun@samsite.ca>

RUN apk --no-cache add \
      make \
      g++ \
    && gem install fpm

CMD ["/usr/local/bundle/bin/fpm", "--help"]
