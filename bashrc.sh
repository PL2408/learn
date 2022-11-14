vim ~/.bashrc

# to remove background from  folders for ls -l
LS_COLORS=$LS_COLORS:'tw=00;33:ow=01;33:'; export LS_COLORS  

# alias to command ssh to aws; Usage: $sshaws@<public_host_ip>
export sshaws='ssh -i ~/.ssh/p_l.pem ec2-user' 

# function to run command ssh to aws; Usage: ssh-aws 3.70.245.233
function ssh-aws {
	ssh -i ~/.ssh/p_l.pem ec2-user@$1
}
