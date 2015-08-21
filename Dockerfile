############################################################
# Dockerfile to run bitcoind, and insight behind nginx
# Based on phusion/baseimage (Ubuntu)
############################################################

# Set the base image to Ubuntu
FROM phusion/baseimage:0.9.16

# File Author / Maintainer
MAINTAINER Moe Adham <moe@bitaccess.co>

# Update the repository
RUN apt-get -qq update > /dev/null

# Install necessary tools
RUN apt-get install -y \
  dialog \
  g++ \
  git \
  make \
  net-tools \
  python \
  python-software-properties \
  wget \
  supervisor > /dev/null

# install bitcoind and clean up, keeping image size down
RUN wget https://github.com/bitcoinxt/bitcoinxt/releases/download/v0.11A/bitcoin-0.11.0-linux64.tar.gz && \
  tar xzf bitcoin-0.11.0-linux64.tar.gz && \
  cp /bitcoin-0.11.0/bin/* /usr/bin && \
  rm bitcoin-0.11.0-linux64.tar.gz && \
  mkdir -p /data/bitcoin

# Expose ports
EXPOSE 8333

# Copy nginx configuration file from the current directory
ADD start.sh start.sh
ADD getinfo.sh getinfo.sh

CMD /start.sh
