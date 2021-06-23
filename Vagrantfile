$ubuntu_mach = 1
$control_mach = 1

Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/bionic64"
    config.vm.box_check_update = false
    config.vagrant.plugins = "vagrant-vbguest"
    config.vagrant.plugins = "vagrant-disksize"
    config.vagrant.plugins = "vagrant-persistent-storage"
    config.disksize.size = "10GB"
    config.persistent_storage.use_lvm = true
    config.persistent_storage.volgroupname = 'vg1'
    config.vm.provision "shell", inline: <<-SHELL
      if lvs | grep vps; then
      echo "==> SHELL PROVISIONER: Setting up logical volumes"
      lvremove -f vg1
      lvcreate vg1 -n test_vol -l 75%FREE
      mkfs.ext4 /dev/vg1/test_vol
      mkdir -p /var/lib/test_vol
      echo "/dev/mapper/vg1-test_vol /var/lib/test_vol               ext4    errors=remount-ro 0       1" >> /etc/fstab
      mount -a
      fi
    SHELL

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
            sudo apt install -y tree
            export ANSIBLE_HOST_KEY_CHECKING=False
            #ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@192.168.1.
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