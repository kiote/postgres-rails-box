#!/bin/sh -e
sudo ln -s /vagrant/gitlabhq/config/unicorn_init.sh /etc/init.d/unicorn
mkdir /vagrant/log
mkdir /vagrant/tmp/pids

chmod -R 777 /vagrant/tmp
chmod -R 777 /vagrant/log

# nginx
sudo rm /etc/nginx/sites-enabled/default
sudo ln -s /vagrant/gitlabhq/config/nginx.conf /etc/nginx/sites-enabled/gitlabhq
sudo service nginx restart

# unicorn
chmod +x /vagrant/gitlabhq/config/unicorn_init.sh
sudo ln -s /vagrant/gitlabhq/config/unicorn_init.sh /etc/init.d/unicorn
sudo service unicorn restart
