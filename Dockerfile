FROM alpine:3.11.6
# some tools
RUN apk add --no-cache --update  \
    ca-certificates \
    curl \
    build-base \
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
    nano \
    go \
    git \
    python-dev \
    libffi-dev \
    openssl-dev \
    libc-dev \
#   ipython \
    cmake \
    nodejs nodejs-npm \
    zsh \
    bash \
    dash \
    socat \
    openssh-client \
    lftp \
    docker \
    gdb \
    htop
    
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && chmod +x kubectl
RUN npm install -g  bufferutil utf-8-validate wscat 

#CMD ["/bin/zsh"]
ENTRYPOINT ["sh"]
