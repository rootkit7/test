FROM alpine:3.7
RUN apk add --no-cache curl nmap vim python nc
ENTRYPOINT ["sh"]
