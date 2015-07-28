# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'json'

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.hostname = "vault-tester"
  config.berkshelf.enabled = true
  config.omnibus.chef_version = :latest
  config.vm.network "public_network", bridge: "en0: Wi-Fi (AirPort)" ,ip: "192.168.1.60"
  VAGRANT_JSON = JSON.parse(Pathname(__FILE__).dirname.join('nodes', 'node.json').read)

  config.vm.provision :chef_solo do |chef|
     chef.cookbooks_path = "../vault-cookbook"
     #chef.roles_path = "roles"
     # You may also specify custom JSON attributes:
     chef.run_list = VAGRANT_JSON.delete('run_list') if VAGRANT_JSON['run_list']
     chef.json = VAGRANT_JSON
  end
end
  

  
