FROM centos:6.4
MAINTAINER Fernando Mayo <fernando@tutum.co>

# Install packages
RUN yum -y install openssh-server && ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key && ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key && echo 'root:changeme' | chpasswd
RUN sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config
RUN sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config

# Add tutum motd
RUN rm -f /etc/motd
ADD http://s.tutum.co/motd /etc/motd

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
