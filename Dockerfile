FROM ubuntu:xenial

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV DEBIAN_FRONTEND noninteractive

COPY docker/conf/nginx.list /etc/apt/sources.list.d/
COPY docker/conf/timezone /etc/

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ABF5BD827BD9BF62 && \
    apt update && apt -y upgrade && \
    apt -y install locales && \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8 && \
    apt -y install software-properties-common && add-apt-repository ppa:ondrej/php && apt update
