# Define Vars
k8s_workers = 2

# Configure VMs
Vagrant.configure("2") do |config|

  config.vm.define "kubemaster" do |k8s_master|
    k8s_master.vm.hostname = "k8s_master"
    k8s_master.vm.box = "ubuntu/bionic64"
    k8s_master.vm.network "private_network", ip: "192.168.99.10"
    k8s_master.vm.provider "virtualbox" do |vb|
      vb.memory = 4096
      vb.cpus = 4
    end

    k8s_master.vm.provision :shell, :inline => "sudo apt-get install python -y"

    k8s_master.vm.provision "ansible" do |ansible|
      ansible.playbook = "./master.yml"
    end
  end

  # (1..k8s_workers).each do |i|
  #   config.vm.define "k8s_worker-#{i}" do |node|
  #       node.vm.box = "ubuntu/bionic64"
  #       node.vm.network "private_network", ip: "192.168.99.#{i + 10}"
  #       node.vm.hostname = "k8s_worker-#{i}"
  #       node.vm.provision "ansible" do |ansible|
  #           ansible.playbook = "kubernetes-setup/node-playbook.yml"
  #       end
  #   end
  # end
end

end
