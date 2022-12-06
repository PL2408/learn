#!/bin/bash -xe
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

yum update -y

yum install java git -y

###################################
#        Create user agent        #
###################################
useradd -m -d /home/agent -s /bin/bash agent

mkdir /home/agent/jenkins
chown agent:agent /home/agent/jenkins

# Set ownership for .ssh folder; Set permission to .ssh/* objects
mkdir /home/agent/.ssh
chmod 700 /home/agent/.ssh


#aws s3 cp s3://lopihara/ssh_keys/web.pk /home/agent/.ssh/web.pk

# Add Agent public key
# Download Agent Publick key from S3 bucket
aws s3 cp s3://lopihara/ssh_keys/agent.pb /home/agent/.ssh/agent.pb
#cat agent.pb >> /home/agent/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDy3Kr6pqNvTDFMC52DzE/60Q7gbptP7h8TiiSDlnJRaIFtHtXx8EQuOhb62jg2eJsXsOQyeqpWErvSTsAt3/6UnOsazadxrsFerhD7lE8h0cOMhQMcG6pxfdK+2b2C5ejF8sC1ZHBGs/yPWZ2nue9hKaTgA4S3/NjbT5jin6wox6r2c+tTonPDdRJuSxRYe53IjrkjvvZ8hEKgoE1h+ooHaElOV9G8ti/w3jof1tm3ALEj6W22KQK4rZz2XJoov9xarJulZeXjJt0FlMcTmNHaLlItbMcwvgVpvwaVbD+hJWb1twSt7rWK2Z6lq74Y1tRDAFxTybyrRRtwas9E7dN/ lopihara@DESKTOP-2PR8U4H" >> /home/agent/.ssh/authorized_keys

chmod 600 /home/agent/.ssh/authorized_keys

chown -R agent:agent /home/agent/.ssh

# custom PS1
echo 'export PS1="\[\e[0;38;5;227m\]\u\[\e[0m\]@\[\e[0;38;5;39m\]jenkins-agent\[\e[0m\][\[\e[0m\]\w\[\e[0m\]]\[\e[0;38;5;240m\]<\[\e[0;38;5;242m\]\t\[\e[0;38;5;241m\]>\[\e[0m\]:\[\e[0m\] "' >> /etc/bashrc