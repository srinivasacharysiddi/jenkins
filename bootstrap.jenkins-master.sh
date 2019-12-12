#!/bin/bash
set -e
# install jenkins
sudo yum update -y
sudo yum install -y wget
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum install -y java-1.8.0-openjdk-devel.x86_64 
sudo yum install -y jenkins
echo "--------Jenkins,Java installed-----------------"
#uncomment the below if you want to lock to a certain version of jenkins
#sudo yum-config-manager --disable jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
echo "--------Jenkins enabled and started------------"
# some useful tools
sudo yum install telnet bind-utils nano git -y
echo "--------Utilities have been installed----------"
sudo yum -y install https://centos7.iuscommunity.org/ius-release.rpm
sudo yum -y install python36u python36u-pip
sudo pip3.6 install awscli
echo "--------Python3,PIP,AWSCLI has been installed--"
#setup timezone
sudo timedatectl set-timezone Asia/Kolakata
echo "--------Timezone has been set------------------"
#setup keys for jenkins
#sudo usermod -s /bin/bash jenkins
#echo jenkins:~pigsfly | sudo chpasswd
sudo -i su -c "ssh-keygen -b 2048 -t rsa -f /var/lib/jenkins/.ssh/id_rsa -q -N \"\"" -m "jenkins"
echo "--------Jenkins user ssh keys generated--------"
sudo cat >> /etc/hosts <<EOF
#jenkins servers - forced since no DNS
192.168.33.21      jenkins
192.168.33.22	jenkins-slave
EOF
echo "--------Added jenkins master/slave to hosts file-----------------------"
