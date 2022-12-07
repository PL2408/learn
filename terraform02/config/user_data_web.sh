#!/bin/bash -xe
# Logging of user_data script
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

###################################
#         Installation            #
###################################
yum update -y
yum install docker git htop -y

###################################
#        Create user web          #
###################################
sudo useradd -m -d /home/web -s /bin/bash web
chmod 755 /home/web

mkdir -p /home/web/.ssh/

# Add Web public key
aws s3 cp s3://lopihara/ssh_keys/web.pb /home/web/.ssh/web.pb
mv /home/web/.ssh/web.pb /home/web/.ssh/authorized_keys

# Set ownership for .ssh folder
chown -R web:web /home/web/.ssh

# Set permission to .ssh/* objects
chmod 700 /home/web/.ssh
chmod 600 /home/web/.ssh/authorized_keys

mkdir /home/web/html
chown -R web:web /home/web/html
chmod 755 /home/web/html

#########################################
#       Start Services                  #
#########################################
# Start docker service
systemctl start docker

# Start nginx
docker run -p 80:80 -v /home/web/html:/usr/share/nginx/html:ro -d nginx




# custom PS1
echo 'export PS1="\[\e[0;38;5;42m\]\u\[\e[0m\]@\[\e[0;38;5;39m\]web-server\[\e[0m\][\[\e[0m\]\w\[\e[0m\]]\[\e[0;38;5;240m\]<\[\e[0;38;5;242m\]\t\[\e[0;38;5;241m\]>\[\e[0m\]:\[\e[0m\] "' >> /etc/bashrc

