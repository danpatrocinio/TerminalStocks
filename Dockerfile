FROM alpine:latest

RUN apk add --no-cache git make go

# Configure Go
ENV GOROOT /usr/lib/go
ENV GOPATH /go
ENV PATH /go/bin:$PATH

RUN mkdir -p ${GOPATH}/src ${GOPATH}/bin

# Install TerminalStocks
RUN go get github.com/brandleesee/TerminalStocks \
    && cd $GOPATH/src/github.com/brandleesee/TerminalStocks/ \
    && make install

# COPY <config_file_example> /root/.TSrc

WORKDIR $GOPATH

# CMD ["TerminalStocks"]
