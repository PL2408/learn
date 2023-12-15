#!/bin/bash -xe
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

# installation
yum update -y 
yum install docker -y 

# start docker service
service docker start 

# run nginx 
docker run -p 80:80 -v /ec2-user/web-page:/usr/share/nginx/html:ro -d nginx

# customize PS1
echo 'export PS1="\[\033[38;5;11m\]\u\[$(tput sgr0)\]@web-server:\[$(tput sgr0)\]\[\033[38;5;6m\][\w]\[$(tput sgr0)\]: \[$(tput sgr0)\]"' >> /etc/bashrc