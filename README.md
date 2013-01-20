tethr.classroom
===============

Log
---

- Install Vagrant (http://downloads.vagrantup.com/)
- Install Vagrant-Salt ::

    vagrant gem install vagrant-salt

- Add a Vagrant box::

    vagrant box add precise64 http://files.vagrantup.com/precise64.box

- The Project directory should look like::

    myvagrant/
      Vagrantfile
      salt/
        minion.conf

- The minion.conf file::

    salt/minion.conf 
    file_client: local
