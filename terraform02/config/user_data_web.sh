#!/bin/bash -xe
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

# Installation
yum update -y
yum install docker git htop -y

# Start docker service
systemctl start docker

# Start nginx
docker run -p 80:80 -v /home/visit_card:/usr/share/nginx/html:ro -d nginx

# custom PS1
echo 'export PS1="\[\e[0;38;5;42m\]\u\[\e[0m\]@\[\e[0;38;5;39m\]\h\[\e[0m\][\[\e[0m\]\W\[\e[0m\]]\[\e[0;38;5;240m\]<\[\e[0;38;5;242m\]\t\[\e[0;38;5;241m\]>\[\e[0m\]:\[\e[0m\] "' >> /etc/bashrc

