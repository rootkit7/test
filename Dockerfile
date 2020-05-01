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
   #netcat-openbsd
    make \
    vim \
    nano \
    jq \
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
    htop \
    screen \
    expect \
    bind-tools \
    sudo \
    su-exec \
    doas
RUN npm install -g  bufferutil utf-8-validate wscat 
WORKDIR /tools
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && chmod +x kubectl
RUN git clone https://github.com/lgandx/Responder.git

RUN adduser -D test01
RUN echo '%test01 ALL=(ALL) ALL' > /etc/sudoers.d/test01 
RUN adduser test01 test01

USER test01
#CMD ["/bin/zsh"]
ENTRYPOINT ["sh"]
