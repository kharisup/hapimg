FROM golang:1.9-alpine

LABEL maintainer="kharis.hidayatullah@gmail.com"

RUN apk add --no-cache git mercurial \
    && go get github.com/random/library/that/I/use/ \
    && apk del git mercurial

# Grab the source code and add it to the workspace.
ADD . /go/src/github.com/sikharis/hapnet

# Install revel and the revel CLI.
RUN go get -v -u -t github.com/revel/revel
RUN go get -v -u -t github.com/revel/cmd/revel
RUN go get -v -u -t github.com/jinzhu/gorm
RUN go get -v -u -t github.com/leekchan/accounting
RUN go get -v -u -t github.com/sikharis/hapnet


# Use the revel CLI to start up our application.
ENTRYPOINT revel run github.com/JustinBeckwith/revel-appengine dev 8080

# Open up the port where the app is running.
EXPOSE 8080
