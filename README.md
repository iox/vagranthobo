vagranthobo
===========

A simple setup with Hobo and Vagrant


Set up a Virtual Ubuntu 12.04 with ruby 2.0, the latest Hobo and sqlite:

    git clone git@github.com:iox/vagranthobo.git
    cd vagranthobo
    vagrant up

And create a Hobo app:

    vagrant ssh
    cd /vagrant
    hobo new mysuperapp --setup
    cd mysuperapp
    rails s

And of course visit http://localhost:3000 :)
