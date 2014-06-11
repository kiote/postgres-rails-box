#!/bin/sh -e
sudo apt-get install curl -y
sudo apt-get install libicu-dev -y

#postgres
sudo apt-get install libpq-dev -y

# mysql
sudo apt-get install libmysql-ruby libmysqlclient-dev -y

# nginx
sudo apt-get install nginx -y

# vim
sudo apt-get install vim -y

# redis
sudo apt-get install redis-server -y

# other stuff
sudo apt-get install -y build-essential zlib1g-dev libyaml-dev libssl-dev libgdbm-dev libreadline-dev libncurses5-dev libffi-dev curl openssh-server redis-server checkinstall libxml2-dev libxslt-dev libcurl4-openssl-dev libicu-dev logrotate python-docutils
