#!/bin/bash -xe
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

yum update -y
amazon-linux-extras enable epel -y
yum install epel-release git -y
yum install -y nginx

cd /home/
git clone https://github.com/PL2408/learn.git
mv /home/learn/learn_html/visit_card /home/
rm -rf /home/learn


# Update permissions to files:
chown -R ec2-user:ec2-user /home/visit_card
chmod 644 /home/visit_card -R
chmod 755 /home/visit_card
chmod 755 /home/visit_card/css
chmod 755 /home/visit_card/images

cp -p /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bk

sed -i 's%/usr/share/nginx/html;%/home/visit_card;%' /etc/nginx/nginx.conf

service nginx start

# Custom PS1
echo 'export PS1="\[\033[38;5;11m\]\u\[$(tput sgr0)\]@\h:\[$(tput sgr0)\]\[\033[38;5;6m\][\w]\[$(tput sgr0)\]: \[$(tput sgr0)\]"' >> /etc/bashrc