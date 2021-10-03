FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04
MAINTAINER jinkim "jinkim@seculayer.com"
RUN sed -i 's@archive.ubuntu.com@mirror.kakao.com@g' /etc/apt/sources.list

RUN apt-get -qq -y update && \
    DEBIAN_FRONTEND=noninteractive apt-get -qq -y install \
        gcc \
        g++ \
        zlibc \
        zlib1g-dev \
        libssl-dev \
        libbz2-dev \
        libsqlite3-dev \
        libncurses5-dev \
        libgdbm-dev \
        libgdbm-compat-dev \
        liblzma-dev \
        libreadline-dev \
        uuid-dev \
        libffi-dev \
        tk-dev \
        wget \
        curl \
        git \
        make \
        sudo \
        bash-completion \
        tree \
        vim \
        default-libmysqlclient-dev \
        software-properties-common && \
    mv /usr/bin/lsb_release /usr/bin/lsb_release.bak && \
    apt-get -y autoclean && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt-get/lists/* \

RUN cd /usr/src \
    && wget https://www.python.org/ftp/python/3.7.7/Python-3.7.7.tgz \
    && tar xzf Python-3.7.7.tgz \
    && cd Python-3.7.7 \
    && ./configure --enable-optimizations \
    && make altinstall \
    && cd ../ \
    && rm -rf Python-3.7.7 \
    && rm -rf Python-3.7.7.tgz \
    && mkdir -p /[@app_dir]

WORKDIR [@app_dir]
