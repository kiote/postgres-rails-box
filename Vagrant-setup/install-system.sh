#!/bin/sh -e
sudo apt-get update

sudo apt-get install curl -y
sudo apt-get install libicu-dev -y

# git
sudo apt-get install -y git-core

#postgres
sudo apt-get install libpq-dev -y --fix-missing

# mysql
# sudo apt-get install libmysql-ruby libmysqlclient-dev -y

# nginx
sudo apt-get install nginx -y

# vim
sudo apt-get install vim -y

# redis
sudo apt-get install redis-server -y

# other stuff
sudo apt-get install -y build-essential
sudo apt-get install -y zlib1g-dev
sudo apt-get install -y libyaml-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y libgdbm-dev
sudo apt-get install -y libreadline-dev
sudo apt-get install -y libncurses5-dev
sudo apt-get install -y libffi-dev
sudo apt-get install -y curl
sudo apt-get install -y openssh-server
sudo apt-get install -y checkinstall
sudo apt-get install -y libxml2-dev
sudo apt-get install libxml2 libxml2-dev libxslt1-dev -y
sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y libicu-dev
sudo apt-get install -y logrotate
sudo apt-get install -y python-docutils
