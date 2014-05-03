vagranthobo
===========

This is a simple example setup with Hobo and Vagrant. You will need to have Vagrant (http://www.vagrantup.com/) and a provider (Virtualbox, Vmware) installed.

First, start a Virtual Ubuntu 12.04 with ruby 2.0, the latest Hobo and sqlite (it will take some minutes):

    git clone https://github.com/iox/vagranthobo.git
    cd vagranthobo
    vagrant up

Then create a Hobo app:

    vagrant ssh
    cd /vagrant
    hobo new mysuperapp --setup
    cd mysuperapp
    rails s

And of course visit [http://localhost:3000](http://localhost:3000) :)



Using PostgreSQL
================
By default this recipe will use Sqlite as a database. If you wish to use postgresql, edit the Vagrantfile like this:

    puppet.manifest_file  = "manifest_postgresql.pp"

The puppet recipe is executed on machine creation (first time you run `vagrant up`). If it was already created and you want to keep it, run `vagrant provision` to run the new recipe and install postgresql.

And finally, when creating the Hobo app, do it like this:

    vagrant ssh
    cd /vagrant
    hobo new mysuperapp --setup --database=postgresql

Now edit config/database.yml, and replace all the contents with:

    development:
      adapter: postgresql
      encoding: utf8
      database: mysuperapp_development
      pool: 5
      template: template0
    test:
      adapter: postgresql
      encoding: utf8
      database: mysuperapp_test
      pool: 5
      template: template0
    production:
      adapter: postgresql
      encoding: utf8
      database: mysuperapp_production
      pool: 5
      template: template0

And finish the setup in the console:

    cd mysuperapp
    rake db:setup
    hobo g migration
    rails s


Notes
=====

* Before we ran `hobo new mysuperapp --setup`, we moved to the /vagrant folder. This is a shared directory that can be accessed from outside the Virtual Machine, so you can edit the files with your favourite editor :).

* If you work with a Linux machine, you might want to try [Vagrant LXC](https://github.com/fgrehm/vagrant-lxc). It's another Vagrant provider that uses "Linux Containers", a very powerful Linux Kernel feature. It's amazingly fast, you won't feel that you using a Virtual Machine. After installing Vagrant LXC, edit the Vagrantfile and uncomment the lines for Vagrant LXC.
