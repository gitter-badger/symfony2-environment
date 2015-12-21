###Enviroment using Vagrant and Ansible

This project provides a virtual environment development using
[Vagrant](https://www.vagrantup.com) and [Ansible](http://www.ansible.com).

Idea: [kleiram](https://github.com/kleiram/vagrant-symfony)

## What's in the box?

- ubuntu/trusty64
- composer
- PHP
- PHP-FPM
- intl
- apc
- nginx with SF2 config
- MySQL
  * Username: `root`
  * Password: empty
- SQLite3
- Git
- PEAR
- XDebug
- NodeJS
- cURL
- npm
- mcrypt
- vim
- memcached
- redis

You can add and remove components as well as the use of additional roles.
You can change the config files, depending on the needs of your application.

For example, if you need a memcached, you need to add it to playbook.yml

## Usage and requirements

- [Ansible installation instructions](http://docs.ansible.com/intro_installation.html#installation).
- [Vagrant](https://www.vagrantup.com)
- [VirtualBox](https://www.virtualbox.org)

### Usage

Clone project into vagrant directory:

    $ cd your-project
    $ git clone https://github.com/mb24dev/symfony2-environment.git vagrant

Or, if you're using Git already in your project, you can use it as a submodule:

    $ cd your-project
    $ git submodule add https://github.com/mb24dev/symfony2-environment.git vagrant

After the project is added, you may configure the environment.
Now you can run the Vagrant:

    $ vagrant up

When the VM is done setting up, point your browser
towards [http://192.168.55.10](http://192.168.55.10)

#### Note

If you're using Windows, replace the following lines in the Vagrantfile:

    config.vm.synced_folder ".",  "/vagrant", id: "vagrant-root", :nfs => true
    config.vm.synced_folder "..", "/var/www", id: "application",  :nfs => true

with:

    config.vm.synced_folder ".",  "/vagrant", id: "vagrant-root"
    config.vm.synced_folder "..", "/var/www", id: "application"

## To-do

- More roles