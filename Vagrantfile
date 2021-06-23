$ubuntu_mach = 3
$control_mach = 1

Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/bionic64"
    config.vm.box_check_update = false
    config.vagrant.plugins = "vagrant-vbguest"
    
    (1..$control_mach).each do |i|
        config.vm.define "control#{i}" do |contr|
          contr.vm.network "public_network", ip: "192.168.1.#{10+i}"
          contr.vm.hostname = "control#{i}"
          contr.vm.provider "virtualbox" do |vb|
            vb.gui = false
            vb.memory = 2048
            vb.cpus = 2
          end
          config.vm.provision "shell", inline: <<-SHELL
            sudo apt update
            sudo apt install -y software-properties-common
            sudo add-apt-repository --yes --update ppa:ansible/ansible
            sudo apt install -y ansible
            sudo apt install -y sshpass
            #export ANSIBLE_HOST_KEY_CHECKING=False
            #ssh-copy-id -i ~/.ssh/id_dsa.pub user@machines
          SHELL
        end
    end

    (1..$ubuntu_mach).each do |i|
        config.vm.define "node#{i}" do |ubuntu|
          ubuntu.vm.network "public_network", ip: "192.168.1.#{20+i}"
          ubuntu.vm.hostname = "ubuntu#{i}"
          ubuntu.vm.provider "virtualbox" do |vb|
            vb.gui = false
            vb.memory = 1024
            vb.cpus = 1
          end
          
        end

    end
   
end