#!/bin/sh -e

HOME_DIR="/vagrant/gitlabhq/"

echo ">>> Unicorn init script <<<"
sudo ln -s ${HOME_DIR}config/unicorn_init.sh /etc/init.d/unicorn

chmod -R 777 /vagrant/tmp
chmod -R 777 /vagrant/log

chmod +x ${HOME_DIR}config/unicorn_init.sh
sudo cp ${HOME_DIR}config/unicorn.rb.example ${HOME_DIR}config/unicorn.rb
sudo service unicorn restart

echo ">>> nginx configuration <<<"
##
sudo apt-get update -y
sudo apt-get install nginx -y
##
sudo rm /etc/nginx/sites-enabled/default
sudo ln -s ${HOME_DIR}config/nginx.conf /etc/nginx/sites-enabled/gitlabhq
sudo service nginx restart
