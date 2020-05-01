FROM alpine:3.7
RUN apk add --no-cache curl nmap vim python nmap-ncat git
ENTRYPOINT ["sh"]
