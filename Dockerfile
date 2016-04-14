FROM ubuntu:14.04
MAINTAINER miiixr

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qy build-essential libssl-dev git man curl

USER root
ENV HOME /root
ENV NODE_VER v4.4.2

RUN git clone https://github.com/creationix/nvm.git $HOME/.nvm

RUN echo '. ~/.nvm/nvm.sh' >> $HOME/.profile

RUN /bin/bash -l -c "nvm install ${NODE_VER}; nvm alias default ${NODE_VER};"
RUN /bin/bash -l -c "npm install -g mocha"


RUN apt-get install -y openssl libreadline6 libreadline6-dev curl zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion pkg-config gcc

# export NVM_DIR="/home/deploy/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Install packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y upgrade

# Add image configuration and scripts
RUN apt-get install -y mysql-server
ADD my.cnf /etc/mysql/conf.d/my.cnf 
ADD run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run

VOLUME ["/var/lib/mysql"]
CMD ["/usr/local/bin/run"]
