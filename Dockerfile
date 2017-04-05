FROM hypriot/rpi-alpine-scratch:v3.4

RUN apk update
RUN apk add git
RUN apk add make
RUN apk add strace
RUN apk add musl-dev


RUN apk --update-cache --allow-untrusted \
        --repository http://dl-4.alpinelinux.org/alpine/edge/community \
        --arch=arm add \
    go \
    && rm -rf /var/cache/apk/*

# Configure Go
ENV GOROOT /usr/lib/go
ENV GOPATH /go
ENV PATH /go/bin:$PATH
#ENV GO15VENDOREXPERIMENT 1

RUN mkdir -p ${GOPATH}/src ${GOPATH}/bin

# Install GB
#RUN go get -u github.com/constabulary/gb/...

# Install Glide
#RUN go get -u github.com/Masterminds/glide/...

WORKDIR $GOPATH

CMD ["make"]
