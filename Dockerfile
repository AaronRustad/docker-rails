FROM        ubuntu
MAINTAINER	Aaron Rustad <arustad@anassina.com>

RUN apt-get update

RUN apt-get -y install python-software-properties
RUN	echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list
RUN add-apt-repository ppa:pitti/postgresql

RUN apt-get update
RUN apt-get -y install curl git bzip2 imagemagick libmysqlclient-dev libxslt-dev libxml2-dev libpq-dev postgresql-client-9.2 libyaml-0-2 nodejs vim telnet

RUN curl -L https://get.rvm.io | bash -s stable
RUN /usr/local/rvm/bin/rvm requirements
RUN /usr/local/rvm/bin/rvm install 2.0.0-p247 --default

RUN useradd -d /home/appuser -m -g rvm -p '' appuser
RUN passwd appuser -d

USER appuser
WORKDIR /home/appuser/client_portal

EXPOSE :3000
