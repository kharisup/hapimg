FROM golang:1.8-alpine

LABEL maintainer="kharis.hidayatullah@gmail.com"

RUN apk add --no-cache git mercurial \
    && go get -v -u -t github.com/revel/revel \
    && go get -v -u -t github.com/revel/cmd/revel \
    && go get -v -u -t github.com/jinzhu/gorm \
    && go get -v -u -t github.com/leekchan/accounting \
    && go get -v -u -t github.com/sikharis/hapnet \    
    && apk del git mercurial

# Grab the source code and add it to the workspace.
#ADD . /go/src/github.com/sikharis/hapnet

# Use the revel CLI to start up our application.
#ENTRYPOINT revel run github.com/sikharis/hapnet dev 8080

# Open up the port where the app is running.
#EXPOSE 8080

WORKDIR /root
CMD revel run github.com/sikharis/hapnet prod
