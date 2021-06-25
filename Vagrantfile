$ubuntu_mach = 4
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
          contr.vm.provision "shell", path: "ansible_for_control_machine_vagrant.sh"
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