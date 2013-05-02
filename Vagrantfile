# vagrant2drupal

Vagrant.configure("2") do |config|

  # Box settings
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  config.vm.hostname  = "drupal.local"
  config.vm.provision :puppet

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "512"]
  end

  # config.vm.network :forwarded_port, host: 80, guest: 80
  config.vm.network :private_network, ip: "10.0.0.8"
end
