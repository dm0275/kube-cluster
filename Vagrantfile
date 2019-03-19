Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/bionic64"

  config.vm.provider "virtualbox" do |vb|
     vb.name = "kube-master"
     vb.cpus = 4
     vb.memory = 4096
  end

  config.vm.provision :shell, :inline => "sudo apt-get install python -y"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "./init.yml"
  end
end
