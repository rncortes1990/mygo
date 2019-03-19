FROM golang:latest

MAINTAINER Raul Cortes <cortesrau@gmail.com>

RUN  apt-get update -y &&\
apt-get -y upgrade &&\
apt-get install -y vim 

ENV GOROOT=/usr/local/go
ENV GOPATH=$HOME/app/go
ENV PATH=$PATH/bin:$GOROOT/bin:$PATH

WORKDIR $HOME/app/go
copy sessions-component $HOME/app/go
RUN env > ~/.profile &&\
go version &&\
go env &&\
mkdir /app/libs && cd /app/libs &&\
go get -u github.com/gorilla/mux


EXPOSE 3000




