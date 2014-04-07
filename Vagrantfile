# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "saucy64"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/saucy/current/saucy-server-cloudimg-amd64-vagrant-disk1.box"
  
  #This folder contains the code, so sync it with the virtual machine 
  config.vm.synced_folder ".", "/home/vagrant/app", owner: "vagrant", group: "www-data"
end

Vagrant.configure("2") do |config|
  #Forward web server to port 8000. This is to support UNIX based OSes that dont allow forwarding to privileged ports
  config.vm.network "forwarded_port", guest: 80, host: 8000
  config.vm.network "forwarded_port", guest: 9876, host: 9876
end

Vagrant.configure("2") do |config|
  config.vm.provision "chef_solo" do |chef|
    chef.add_recipe "apt"
    chef.add_recipe "mysql"
    chef.add_recipe "devbox"
    chef.add_recipe "app"
    chef.add_recipe "restart-servers"
  end
end

#Use 1024M of RAM and 2 cpu cores/cpus. You can customize this if you wish.
Vagrant.configure("2") do |config|
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]   
  end
end
