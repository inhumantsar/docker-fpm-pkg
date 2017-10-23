FROM centos
MAINTAINER Shaun Martin <shaun@samsite.ca>

RUN yum clean all \
    && yum install -y \
      gcc-c++ \
      libffi-devel \
      make \
      rpm \
      ruby \
      ruby-devel \
      ruby-irb \
      ruby-rdoc \
    && gem install fpm

CMD ["/usr/local/bundle/bin/fpm", "--help"]
