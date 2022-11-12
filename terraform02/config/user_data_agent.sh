#!/bin/bash -xe
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

yum update -y

yum install java -y

mkdir /home/ec2-user/jenkins
chown ec2-user:ec2-user /home/ec2-user/jenkins

echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC9rw7tTNoeT7KQlBTZFZcaMZtzcjtQdj6H1aoNevmj8JcylBTUa3JxkDk78vcYV6t6MF7Tq61QY6IZhRlAPoGWyPRP6GIMKa6tlyoUTYntTijn0+9WA78WQRV7GQFoxNbS5KWMAXL7vxG8gqkHvg3+2ZRdcUyg7UuMntINle4+MikNdVTUqZqyl1rqfc6yu+qFs2jyiicO/yuE0ITFCv1QPGwJAeFH1Z3H5OYP8WoV8xEGga3xE2f8S161ZmSCyzv7fEmJMosvWeW2ZGfZJHClGCyRMIuoCtSnFBBsJBplhLmAIPNYvQajQj+d3xa8LvKSc+48XvelefxxPl5zhJ83ClzseIEmsmzTN6fdVAz6MyDJQkaadD5j/o4Ydg/4OKK0qHc0a9xX2eq09pIjXk485j872yhPj6aBqrY1MVvwLk4IeKIR9T11Aeu0FVdtVmT/Zu+J577PJcOPbkkJOYRYBiAKg9EawtDy+Lw5bAquYsSHf2pWyBmmuyUMlF7vQr8= jana@DESKTOP-L96TOG7" >> /home/ec2-user/.ssh/authorized_keys

# custom PS1
echo 'export PS1="\[\e[0;38;5;227m\]\u\[\e[0m\]@\[\e[0;38;5;39m\]\h\[\e[0m\][\[\e[0m\]\W\[\e[0m\]]\[\e[0;38;5;240m\]<\[\e[0;38;5;242m\]\t\[\e[0;38;5;241m\]>\[\e[0m\]:\[\e[0m\] "' >> /etc/bashrc