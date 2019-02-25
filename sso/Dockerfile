FROM centos:7
MAINTAINER edward@nygma.com

# Getting last software catalog
RUN yum -y update && yum clean all

# Needed dependencies
RUN yum install -y wget gcc-c++

ENV APP_DIR=/app

ENV GOLANG_VERSION="go1.12rc1.linux-amd64.tar.gz" \
    GOROOT="/go" \
    GOPATH=$APP_DIR

ENV PATH=$GOPATH/bin:$GOROOT/bin:$PATH \
    GOSETUP_URL="https://storage.googleapis.com/golang/$GOLANG_VERSION" \
    MD5="16bc3f6fa346b7081552ebcced6709a2" \
    GOSETUP_PKG="/$GOLANG_VERSION"

# Download and install Golang
RUN wget -q -O $GOSETUP_PKG $GOSETUP_URL && \
    echo "$MD5 *$GOSETUP_PKG" | md5sum -c - && \
    tar xvzf $GOSETUP_PKG -C / && \
    rm -f $GOSETUP_PKG

COPY service $APP_DIR
WORKDIR $APP_DIR

RUN go build -o server .

CMD ["/app/server"]
