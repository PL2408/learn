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
mkdir -p /home/web/.ssh/

# Add Web public key
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDRU0atCE8l0qbuEPCL2/42EXAgPUa5Z+wwXc9Ny4ueyn77Y+/LgNCiWUPNHOWRPuy1N6TC/5Ku3G8BAeJVCmQ9vRa74YQ29MdpiP7YmXYm1uc2zpjlxOaRDzSIVhOdEqf38wnpasN0y45OjWLxjIjGfxfZrCgoxyboRf5TIPM98zVjUBjFqs9VBX3i9QE+HXdmB/H/2BVjFSHderBAXxQvGXsXiDwTq3YLi2vU/p0c+UA4aKFGjJLNVrRfH+5NBtPBYHn2YOmgiI4fTZlxblX2vXTyw/fWnmx2aS2T2467t4i+aQ8QkiEigjxOHehc0TNQA4jayozIB2TJbaRK5ziDkkXMcCwyTeuSHZtkqYT6OtXUmdgNJqWo1vd16sh87m8CzVn/Z8Zbh3afNZYZpDEzS0WX3G2N0V6Zm6UASkO0T4hbDIsSvd+7LQNyxjSCr1AQ26oa19jDS1upVSGUDIZnL4+cMmT4n1dKt78NN/axPNH5Nxh05LQHCjR9nY3/4bU= jana@DESKTOP-L96TOG7" >> /home/web/.ssh/authorized_keys

# Set ownership for .ssh folder
chown -R web:web /home/web/.ssh

# Set permission to .ssh/* objects
chmod 700 /home/web/.ssh
chmod 600 /home/web/.ssh/authorized_keys

mkdir /home/web/html
chown web:web /home/web/html

#########################################
#       Start Services                  #
#########################################
# Start docker service
systemctl start docker

# Start nginx
docker run -p 80:80 -v /home/web/html:/usr/share/nginx/html:ro -d nginx




# custom PS1
echo 'export PS1="\[\e[0;38;5;42m\]\u\[\e[0m\]@\[\e[0;38;5;39m\]web-server\[\e[0m\][\[\e[0m\]\w\[\e[0m\]]\[\e[0;38;5;240m\]<\[\e[0;38;5;242m\]\t\[\e[0;38;5;241m\]>\[\e[0m\]:\[\e[0m\] "' >> /etc/bashrc

