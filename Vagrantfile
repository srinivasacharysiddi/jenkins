# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define :jenkins do |jenkins_config|
    jenkins_config.vm.box = "centos/7"
    jenkins_config.vm.hostname = "jenkins-master"
    jenkins_config.vm.network "forwarded_port", guest:80, host: 8080
    jenkins_config.vm.network "private_network", ip: "192.168.33.21"
    jenkins_config.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end
    jenkins_config.vm.provision :shell, path: "bootstrap-jenkins-master.sh"
  end

  config.vm.define :jenkinsslave do |jenkinsslave_config|
    jenkinsslave_config.vm.box = "centos/7"
    jenkinsslave_config.vm.hostname = "jenkins-slave"
    jenkinsslave_config.vm.network "private_network", ip: "192.168.33.22"
    jenkinsslave_config.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end
    jenkinsslave_config.vmprovision :shell, path: "bootstrap-jenkins-slave.sh"
  end
end
