Vagrant.configure('2') do |config|

  # Box settings
  config.vm.box = 'precise32'
  config.vm.box_url = 'http://files.vagrantup.com/precise32.box'
  config.vm.hostname = 'vagrant4drupal.dev'
  config.vm.network :private_network, ip: '10.0.0.8'

  # Provider settings (VirtualBox)
  config.vm.provider :virtualbox do |vb|
    vb.customize [
      'modifyvm', :id,
      '--memory', '1024',
      '--cpus', '2',
    ]
  end

  # Provisioner settings (Puppet)
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.module_path = 'puppet/modules'
    puppet.facter = {
      'fqdn' => 'vagrant4drupal.dev'
    }
    # puppet.options = '--verbose'
  end
end
