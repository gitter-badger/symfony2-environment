Vagrant.configure(2) do |config|
    # Box
    config.vm.box = "ubuntu/trusty64"

    # Network
    config.vm.network :forwarded_port,  guest: 80,    host: 8080, auto_correct: true
    config.vm.network :forwarded_port,  guest: 8081,  host: 8081, auto_correct: true
    config.vm.network :forwarded_port,  guest: 3306,  host: 3306, auto_correct: true
    config.vm.network :forwarded_port,  guest: 27017, host: 27017, auto_correct: true
    config.vm.network "private_network", ip: "192.168.55.10"

    # Shared folders
    config.vm.synced_folder ".",  "/vagrant", id: "vagrant-root", :nfs => true
    config.vm.synced_folder "..", "/var/www", id: "application",  :nfs => true

    # Enviroment
    config.vm.provider :virtualbox do |v|
        v.name = (0...8).map { (65 + rand(26)).chr }.join
        v.customize [ "modifyvm", :id, "--memory", 512 ]
    end

    # Ansible provision
    config.vm.provision :ansible do |ansible|
        ansible.extra_vars = { ansible_ssh_user: 'vagrant' }
        ansible.playbook = "ansible/playbook.yml"
    end
end