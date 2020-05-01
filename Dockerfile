FROM alpine:3.7
RUN apk add --no-cache --update curl nmap vim python nmap-ncat git nodejs nodejs-npm
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && chmod +x kubectl
ENTRYPOINT ["sh"]
