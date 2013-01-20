tethr.classroom
===============

Log
---

- Install Vagrant (http://downloads.vagrantup.com/)
- Install Vagrant-Salt ``vagrant gem install vagrant-salt``
- Add a Vagrant box ``vagrant box add precise64 http://files.vagrantup.com/precise64.box``

The Project directory should look like:

    myvagrant/
      Vagrantfile
      salt/
        minion.conf

Create a Vagrantfile:

    Vagrant::Config.run do |config|
      config.vm.box = "precise64"
      config.vm.network :hostonly, "192.168.33.10"
      config.vm.share_folder "salt_file_root", "/srv", "."
      
      ## Use all the defaults:
      config.vm.provision :salt do |salt|
        salt.run_highstate = true

        ## Optional Settings:
        salt.minion_config = "salt/minion.conf"
        # salt.temp_config_dir = "/existing/folder/on/basebox/"
        # salt.salt_install_type = "git"
        # salt.salt_install_args = "develop"
    
        ## If you have a remote master setup, you can add
        ## your preseeded minion key
        # salt.minion_key = "salt/key/minion.pem"
        # salt.minion_pub = "salt/key/minion.pub"
      end


Create a minion.conf file:

    file_client: local

