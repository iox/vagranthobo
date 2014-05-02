# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'lxc'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Box for Vagrant Virtualbox / Vmware (default)
  config.vm.box = "hashicorp/precise64"

  # Box for Vagrant LXC
  # config.vm.box = "precise64"
  # config.vm.box_url = "http://bit.ly/vagrant-lxc-precise64-2013-10-23"

  config.vm.network :forwarded_port, guest: 3000, host: 3000

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "environment"
    puppet.manifest_file  = "manifest.pp"
    puppet.module_path = "environment/modules"
  end
end
