FROM ubuntu:17.04

# Must have packages
RUN apt-get update && apt-get install -y vim nano zsh curl git sudo

# Install Oh my Zsh
RUN bash -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
RUN sed -i -- 's/robbyrussell/sonicradish/g' /root/.zshrc 

# Add none root user
RUN  useradd admin && echo "admin:admin" | chpasswd && adduser admin sudo
USER admin
