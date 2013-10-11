from	ubuntu:precise
maintainer	Aaron Rustad <arustad@anassina.com>

RUN apt-get update

RUN apt-get -y install python-software-properties
RUN add-apt-repository ppa:pitti/postgresql

RUN apt-get update
RUN apt-get -y install curl git bzip2 imagemagick libmysqlclient-dev libxslt-dev libxml2-dev libpq-dev postgresql-client-9.2 libyaml-0-2

#RUN useradd -d /home/appuser -s /home/appuser --disabled-password -m appuser
RUN adduser --home /home/appuser --shell /home/appuser --disabled-password --gecos "" appuser

#RUN curl -L https://get.rvm.io | bash -s stable
#RUN /usr/local/rvm/bin/rvm requirements
#RUN /usr/local/rvm/bin/rvm install 2.0.0 --default

USER appuser

EXPOSE :3000
