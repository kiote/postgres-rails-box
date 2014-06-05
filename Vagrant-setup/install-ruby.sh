#!/usr/bin/env bash

 source /usr/local/rvm/scripts/rvm

 rvm use --install $1

 shift

 if (( $# ))
 then gem install $@
 fi

# use just installed ruby as default
rvm use $1 --default

# change permissions to rvm folder
sudo chown -R vagrant /usr/local/rvm

# create project gemset
rvm use $1@gitlabhq --create

#kind of hardocde here
sudo chown -R vagrant /usr/local/rvm/gems/ruby-2.1.2@gitlabhq

sudo ln -s /vagrant/gitlabhq/config/unicorn_init.sh /etc/init.d/unicorn
mkdir /vagrant/tmp
mkdir /vagrant/log
mkdir /vagrant/tmp/pids
chmod -R 777 /vagrant/tmp
chmod -R 777 /vagrant/log
