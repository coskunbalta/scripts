#!/bin/bash
#dev server tools build script - linux - debian/ubuntu
#region london

#web gke-cluster-terraform # history


apt-get update;
apt-get upgrade;

#Google SDK steps
#Get latest sdk url from https://cloud.google.com/sdk/docs/
pwd;
echo "Get latest sdk url from https://cloud.google.com/sdk/docs/";
read URL;
echo $(date) 'Running wget...';
wget "${URL}";
tar xvzf google-cloud-sdk-*;
./google-cloud-sdk/install.sh
./google-cloud-sdk/bin/gcloud init;

#Install kubectl https://kubernetes.io/docs/tasks/tools/install-kubectl/
gcloud components install kubectl;






#Git
apt-get install git -y;
git status;
git clone https://github.com/coskunbalta/project-pitandolive.git;
git clone https://github.com/llarsson/gke-cluster-terraform.git;
cd gke-cluster-terraform/;
git remote -v;
cd ../;





#Install Python 3.7: https://tecadmin.net/install-python-3-7-on-ubuntu-linuxmint/
sudo apt-get install build-essential checkinstall;
sudo apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev \
    libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev;
cd /usr/src;
sudo wget https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tgz;
sudo tar xzf Python-3.7.4.tgz;
cd Python-3.7.4;
sudo ./configure --enable-optimizations;
sudo make altinstall;
python3.7 -V;
cd ../../;

apt-get install smokeping httperf jmeter siege python-boto traceroute htop sysstat nmap mtr vim curl;

#pip for python3.x
apt-get install python3-pip;
pip3 --version;


#Bees with machine guns tool (EC2 URL Load testing): https://github.com/newsapps/beeswithmachineguns
pip3 install https://github.com/newsapps/beeswithmachineguns/archive/master.zip;
#pip3 install https://github.com/newsapps/beeswithmachineguns/archive/master.zip



#tcpick - TCP stream sniffer and connection tracker
#tcpspy - Incoming and Outgoing TCP/IP connections logger
#tcptrack - TCP connection tracker, with states and speeds
apt-get install tcpick;


#aws cli tools - https://docs.aws.amazon.com/cli/latest/userguide/install-linux.html

curl -O https://bootstrap.pypa.io/get-pip.py;
python3 get-pip.py --user;
#add $PATH of awscli config to end of bash profile
echo "export PATH=~/.local/bin:$PATH" >> /root/.bashrc;
source /root/.bashrc;
pip3 install awscli --upgrade --user;
aws --version;


#Install virtualenv
mkdir dev;
cd dev;
pip3 install --user virtualenv;
#create virualenv
virtualenv ENV;
#modify path/to/ENV/bin/activate
source /root/dev/ENV/bin/activate;
deactivate;
cd ../;


#terraform Install
#download correct version of terraform: https://www.terraform.io/downloads.html
echo "Get latest terraform install url from https://www.terraform.io/downloads.html";
read URL2;
echo $(date) 'Running wget...';
wget "${URL2}";
gunzip terraform*;

#add PATH of terraform to bashrc file like below
#export PATH=~/.local/bin:/root/google-cloud-sdk/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root
export PATH="$PATH:/root/"
source ~/.bashrc;
