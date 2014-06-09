# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<SCRIPT
echo I am provisioning...
date > /etc/vagrant_provisioned_at
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.provision "shell", inline: $script
end

Vagrant::Config.run do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.share_folder "bootstrap", "/mnt/bootstrap", ".", :create => true
  config.vm.provision :shell, :path => "Vagrant-setup/bootstrap.sh"

  config.ssh.forward_agent = true

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks"]
    chef.add_recipe "apt"
    chef.add_recipe "build-essential"
    chef.add_recipe "git"
  end

  config.vm.provision :shell, :path => "Vagrant-setup/install-system.sh"
  config.vm.provision :shell, :path => "Vagrant-setup/install-rvm.sh",  :args => "stable"
  config.vm.provision :shell, :path => "Vagrant-setup/install-ruby.sh", :args => "2.1.2"

  # PostgreSQL Server port forwarding
  config.vm.forward_port 5432, 15432
  config.vm.forward_port 80, 8080
end
