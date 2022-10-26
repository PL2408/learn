##!/bin/bash -xe
#exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
#
#yum update -y
#amazon-linux-extras enable epel -y
#yum install epel-release git -y
#yum install -y nginx
#cd /home/
#git clone https://github.com/PL2408/learn.git
#mv /home/learn/learn_html/visit_card /home/
#rm -rf /home/learn
#
#
## Update permissions to files:
#chown -R ec2-user:ec2-user /home/visit_card
#chmod 644 /home/visit_card -R
#chmod 755 /home/visit_card
#chmod 755 /home/visit_card/css
#chmod 755 /home/visit_card/images
#
#cp -p /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bk
#
#sed -i 's%/usr/share/nginx/html;%/home/visit_card;%' /etc/nginx/nginx.conf
#
#service nginx start
#
##--------- Docker --------------------
##yum install docker -y
##service docker start
#
## ------- TeamCity -------------------
##mkdir /opt/tc
##mkdir /opt/tc/data
##mkdir /opt/tc/logs
##
##chown 1000:1000 -R /opt/tc
##
##docker run -d --rm --name teamcity-server-instance  \
##    -v /opt/tc/data:/data/teamcity_server/datadir \
##    -v /opt/tc/logs:/opt/teamcity/logs  \
##    -p 80:8111 \
##    jetbrains/teamcity-server
#
## --------- Jira -------------------
##docker volume create --name jiraVolume
##sleep 5
##docker run -v jiraVolume:/var/atlassian/application-data/jira --name="jira" -d -p 80:8080 atlassian/jira-software
#
## --------- Jenkins -----------------
##docker run -d -p 80:8080 -p 50000:50000 --restart=on-failure jenkins/jenkins:lts-jdk11
#
#
#
#
## Custom PS1
#echo 'export PS1="\[\033[38;5;11m\]\u\[$(tput sgr0)\]@\h:\[$(tput sgr0)\]\[\033[38;5;6m\][\w]\[$(tput sgr0)\]: \[$(tput sgr0)\]"' >> /etc/bashrc