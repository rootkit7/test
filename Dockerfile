#FROM alpine
#FROM alpine:3.7
FROM jefferyb/openshift-alpine
#RUN apk add --no-cache shadow sudo 
RUN apk --update add --no-cache openssh shadow sudo curl nmap
RUN useradd test 
RUN groupadd -g 61000 test-target
RUN useradd -g 61000 -l -m -s /bin/false -u 61000 test-target
#RUN echo "root:1234567Ab-" | chpasswd
#RUN echo "test:1234567Ab-" | chpasswd


# Modify sshd_config items to allow login
RUN sed -i 's/#PermitRootLogin.*/PermitRootLogin\ yes/' /etc/ssh/sshd_config && \
    sed -ie 's/#Port 22/Port 22/g' /etc/ssh/sshd_config && \
    sed -ri 's/#HostKey \/etc\/ssh\/ssh_host_key/HostKey \/etc\/ssh\/ssh_host_key/g' /etc/ssh/sshd_config && \
    sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_rsa_key/HostKey \/etc\/ssh\/ssh_host_rsa_key/g' /etc/ssh/sshd_config && \
    sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_dsa_key/HostKey \/etc\/ssh\/ssh_host_dsa_key/g' /etc/ssh/sshd_config && \
    sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_ecdsa_key/HostKey \/etc\/ssh\/ssh_host_ecdsa_key/g' /etc/ssh/sshd_config && \
    sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_ed25519_key/HostKey \/etc\/ssh\/ssh_host_ed25519_key/g' /etc/ssh/sshd_config

# Generate new keys
RUN /usr/bin/ssh-keygen -A && ssh-keygen -t rsa -b 4096 -f  /etc/ssh/ssh_host_key
USER test 
CMD ["/usr/sbin/sshd","-D"]  # Start the ssh daemon
