FROM ubuntu:bionic
MAINTAINER edward@nygma.com

# getting last software catalog
RUN apt-get update

# Minimal deb packages required
RUN apt-get install -y --no-install-recommends curl ca-certificates git

# Remove downloaded .debs from cache
RUN apt-get clean

# No longer needed list of packages
RUN rm -rf /var/lib/apt/lists/*

ENV APP_DIR=/app
ENV GOLANG_VERSION="go1.12.1.linux-amd64.tar.gz" \
    GOROOT="/go" \
    GOPATH=$APP_DIR
ENV PATH=$GOPATH/bin:$GOROOT/bin:$PATH \
    GOSETUP_URL="https://storage.googleapis.com/golang/$GOLANG_VERSION" \
    SHA256="2a3fdabf665496a0db5f41ec6af7a9b15a49fbe71a85a50ca38b1f13a103aeec" \
    GOSETUP_PKG="/$GOLANG_VERSION"
ENV GO_DEPS_NEEDED="github.com/codegangsta/negroni \
    github.com/dgrijalva/jwt-go \
    github.com/garyburd/redigo/redis \
    github.com/gorilla/mux \
    golang.org/x/crypto/bcrypt"

# Download and install Golang
RUN curl -LO $GOSETUP_URL && \
    echo "$SHA256 *$GOSETUP_PKG" | sha256sum -c - && \
    tar xvzf $GOSETUP_PKG -C / && \
    rm -f $GOSETUP_PKG

COPY service $APP_DIR
WORKDIR $APP_DIR

# Fetches go dependencies for compilation
RUN for _dep in $GO_DEPS_NEEDED; do go get -u "$_dep"; done

# Compiles the sso server
RUN go build -o server .

EXPOSE 8080

ENTRYPOINT ["/app/docker-entrypoint.sh"]
