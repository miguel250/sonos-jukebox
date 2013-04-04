# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "precise64"

  config.vm.box_url = "https://www.dropbox.com/s/ro6qtsxp7sf6zmu/ubuntu.box?dl=1"


  config.vm.network :public_network

  config.vm.synced_folder ".", "/home/vagrant/app/"


  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.add_recipe "python-redis-nodejs"

    # You may also specify custom JSON attributes:
    #chef.json = { :mysql_password => "foo" }
  end
end
