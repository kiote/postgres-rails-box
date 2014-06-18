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

echo ">>> installing gems <<<"
cd /vagrant/gitlabhq
bundle install --without mysql


bundle exec rake gitlab:shell:install[v1.9.5] REDIS_URL=redis://localhost:6379 RAILS_ENV=production
bundle exec rake assets:precompile RAILS_ENV=production

sudo cp lib/support/init.d/gitlab /etc/init.d/gitlab

# can't find rubygems.org:
rvm pkg install openssl; rvm reinstall all —with-openssl-dir=$rvm_path/usr

# mkdir for unicorn pid
mkdir /tmp/pids
mkdir /tmp/sockets

# create repo root
sudo mkdir /home/git/
sudo chown vagrant /home/git/
mkdir /home/git/repositories

# start unicorn
unicorn -D -c config/unicorn.rb -E production
