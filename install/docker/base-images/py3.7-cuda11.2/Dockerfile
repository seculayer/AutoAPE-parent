FROM nvidia/cuda:11.2.0-cudnn8-devel-ubuntu18.04
MAINTAINER jinkim "jinkim@seculayer.com"

ARG VERSION=3.7
ARG FULL_VERSION=${VERSION}.7

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
    rm -rf /var/lib/apt-get/lists/*

RUN cd /usr/src \
    && wget https://www.python.org/ftp/python/${FULL_VERSION}/Python-${FULL_VERSION}.tgz \
    && tar xzf Python-${FULL_VERSION}.tgz \
    && cd Python-${FULL_VERSION} \
    && ./configure --enable-optimizations \
    && make altinstall \
    && cd ../ \
    && rm -rf Python-${FULL_VERSION} \
    && rm -rf Python-${FULL_VERSION}.tgz

RUN python${VERSION} -m pip install --upgrade pip
