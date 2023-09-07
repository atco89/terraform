#!/bin/sh

##################################################
# create project directory
##################################################

mkdir -p /var/www/html

##################################################
# install default packages
##################################################

apt-get update
apt-get install -y \
  git \
  make \
  apache2-utils

##################################################
# setup docker repository
##################################################

apt-get update
apt-get install -y \
  ca-certificates \
  curl \
  gnupg
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

##################################################
# docker (24.0.4)
##################################################

apt-get update
apt-get install -y \
  docker-ce \
  docker-ce-cli \
  containerd.io \
  docker-buildx-plugin \
  docker-compose-plugin

##################################################
# docker compose (2.21.0)
##################################################

apt-get update
curl -L "https://github.com/docker/compose/releases/download/v2.21.0/docker-compose-$(uname -s)-$(uname -m)" \
  -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

#####################################################################################
# add some handy aliases
#####################################################################################

echo "
cd /var/www/html
alias u='sudo apt-get update -y && sudo apt-get upgrade -y'
alias ll='ls -ltra'
alias vi='vim'
alias ..='cd ./../'
alias ...='cd ./../../'
alias ....='cd ./../../../'
alias su='sudo -i'
alias make='gmake'
" >>~/.bashrc