FROM ubuntu:bionic
MAINTAINER edward@nygma.com

# getting last software catalog
RUN apt-get update --fix-missing

# Minimal deb packages required
RUN apt-get install --quiet -y --no-install-recommends curl ca-certificates git bash build-essential

# Remove downloaded .debs from cache
RUN apt-get clean

# No longer needed list of packages
RUN rm -rf /var/lib/apt/lists/*

ENV PORT=8080
ENV APP_DIR=/app
ENV GOLANG_VERSION="go1.12.1.linux-amd64.tar.gz" \
    GOROOT="/go" \
    GOPATH=$APP_DIR
ENV PATH=$GOPATH/bin:$GOROOT/bin:$PATH \
    GOSETUP_URL="https://storage.googleapis.com/golang/$GOLANG_VERSION" \
    SHA256="2a3fdabf665496a0db5f41ec6af7a9b15a49fbe71a85a50ca38b1f13a103aeec" \
    GOSETUP_PKG="/$GOLANG_VERSION"

# Download and install Golang
RUN curl -LO $GOSETUP_URL && \
    echo "$SHA256 *$GOSETUP_PKG" | sha256sum -c - && \
    tar xvzf $GOSETUP_PKG -C / && \
    rm -f $GOSETUP_PKG

RUN mkdir -p $APP_DIR/{bin,pkg,src/service}
WORKDIR $APP_DIR/src/service
COPY ./service .

# Compiles the sso server
RUN go build -o server

EXPOSE $PORT

CMD ["/app/src/service/docker-entrypoint.sh"]
