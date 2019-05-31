FROM ubuntu:18.04

# install ubuntu packages
RUN apt-get update -q \
 && apt-get install -y \
    git \
    wget \
    gcc \
    build-essential \
    libzmq3-dev \
    libtool \
    autotools-dev \
    automake \
    pkg-config \
    libssl-dev \
    libevent-dev \
    bsdmainutils \
    libboost-all-dev\
    ca-certificates

# install bitcoin-sv
RUN git clone https://github.com/bitcoin-sv/bitcoin-sv.git --branch v0.2.0 /root/bitcoin-sv
WORKDIR /root/bitcoin-sv
RUN ./autogen.sh
RUN ./configure --disable-wallet --disable-tests
RUN make
RUN make install
ADD ./bitcoin.conf /Bitcoin/bitcoin.conf

EXPOSE 8332 8333 18332 18333 28332

# install golang
RUN wget -P /tmp https://dl.google.com/go/go1.11.5.linux-amd64.tar.gz

RUN tar -C /usr/local -xzf /tmp/go1.11.5.linux-amd64.tar.gz
RUN rm /tmp/go1.11.5.linux-amd64.tar.gz

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"

WORKDIR $GOPATH

# install tokenized smart-contract
# RUN mkdir -p $GOPATH/src/github.com/tokenized
# RUN cd $GOPATH/src/github.com/tokenized \
#  && git clone https://github.com/tokenized/smart-contract.git

# WORKDIR $GOPATH/src/github.com/tokenized/smart-contract

# ADD ./smart-contract.sh ./smart-contract.sh

# RUN sh ./smart-contract.sh

# RUN make

# CMD ["make", "run"]
# RUN go get github.com/tokenized/smart-contract/cmd/...
