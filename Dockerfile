FROM ubuntu:14.10
MAINTAINER Aleksander Marchenko, maappdev@gmail.name

ENV workspace /opt/workspace
RUN mkdir -p $workspace > /dev/null

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
    libssl-dev \
    gcc \
    git \
    g++ \
    make \
    python2.7 \
    ssh \
    wget \
    && apt-get autoremove \
    && apt-get clean \

# Config python
ENV python_path  /usr/bin/python2.7
RUN ln -sf $python_path /usr/bin/python > /dev/null

RUN cd $workspace && \
    wget http://nodejs.org/dist/v0.10.33/node-v0.10.33.tar.gz && \
    tar vfx $workspace/node* && \
    rm node*.gz && \
    cd node* 

RUN cd $workspace/node* && \
./configure && \
make -j8 && \
make install && \
npm install -g bower && \
npm install -g gulp && \
npm install -g forever && \
npm install -g grunt && \
npm install -g yo && \
npm install -g generator-angular



