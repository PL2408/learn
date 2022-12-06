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


aws s3 cp s3://lopihara/ssh_keys/web.pk /home/agent/.ssh/web.pk

# Add Agent public key
# Download Agent Public key from S3 bucket
aws s3 cp s3://lopihara/ssh_keys/agent.pb /home/agent/.ssh/agent.pb
cat /home/agent/.ssh/agent.pb >> /home/agent/.ssh/authorized_keys
rm /home/agent/.ssh/agent.pb

chmod 400 /home/agent/.ssh/web.pk
chmod 600 /home/agent/.ssh/authorized_keys

chown -R agent:agent /home/agent/.ssh

# custom PS1
echo 'export PS1="\[\e[0;38;5;227m\]\u\[\e[0m\]@\[\e[0;38;5;39m\]jenkins-agent\[\e[0m\][\[\e[0m\]\w\[\e[0m\]]\[\e[0;38;5;240m\]<\[\e[0;38;5;242m\]\t\[\e[0;38;5;241m\]>\[\e[0m\]:\[\e[0m\] "' >> /etc/bashrc