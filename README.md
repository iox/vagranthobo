vagranthobo
===========

This is a simple example setup with Hobo and Vagrant. You will need to have Vagrant (http://www.vagrantup.com/) and a provider (Virtualbox, Vmware) installed.

First, start a Virtual Ubuntu 12.04 with ruby 2.0, the latest Hobo and sqlite (it will take some minutes):

    git clone git@github.com:iox/vagranthobo.git
    cd vagranthobo
    vagrant up

Then create a Hobo app:

    vagrant ssh
    cd /vagrant
    hobo new mysuperapp --setup
    cd mysuperapp
    rails s

And of course visit [http://localhost:3000](http://localhost:3000) :)



Notes
=====

* Before we ran `hobo new mysuperapp --setup`, we moved to the /vagrant folder. This is a shared directory that can be accessed from outside the Virtual Machine, so you can edit the files with your favourite editor :).

* If you work with a Linux machine, you might want to try [Vagrant LXC](https://github.com/fgrehm/vagrant-lxc). It's another Vagrant provider that uses "Linux Containers", a very powerful Linux Kernel feature. It's amazingly fast, you won't feel that you using a Virtual Machine. After installing Vagrant LXC, edit the Vagrantfile and uncomment the lines for Vagrant LXC.
