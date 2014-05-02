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
