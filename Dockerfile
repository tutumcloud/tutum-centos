FROM centos:6.4
MAINTAINER Fernando Mayo <fernando@tutum.co>

# Install packages
RUN yum -y install openssh-server && ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key && ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key && sed -ri 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config && echo 'root:changeme' | chpasswd

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
