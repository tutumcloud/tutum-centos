FROM centos:centos6
MAINTAINER Feng Honglin <hfeng@tutum.co>

# Install packages and set up sshd
RUN yum -y install openssh-server
RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key && ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key && sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config

# Add scripts
RUN rpm -i http://dl.fedoraproject.org/pub/epel/6/x86_64/pwgen-2.06-5.el6.x86_64.rpm
ADD set_root_pw.sh /set_root_pw.sh
ADD run.sh /run.sh
RUN chmod +x /*.sh

EXPOSE 22
CMD ["/run.sh"]
