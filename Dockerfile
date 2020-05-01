FROM alpine:3.7
# some tools
RUN apk add --no-cache --update  \
    ca-certificates \
    curl \
    gettext \
    python \
    py-pip \
    py-setuptools \
    rsync \
    nmap \
    e2fsprogs-extra \
    tcpdump \
    tshark \
    gcc \
    nmap-ncat \
    make \
    vim \
    go \
    git \
    python-dev \
    libffi-dev \
    openssl-dev \
    libc-dev \
#   ipython \
    build-base \
    cmake \
    nodejs nodejs-npm \
    zsh
    
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && chmod +x kubectl
RUN npm install -g wscat

#CMD ["/bin/zsh"]
ENTRYPOINT ["sh"]
