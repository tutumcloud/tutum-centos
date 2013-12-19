FROM centos:6.4
MAINTAINER Fernando Mayo <fernando@tutum.co>

# Install packages and set up sshd
RUN yum -y install openssh-server pwgen
RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key && ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key && sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config

# Add scripts
ADD https://raw.github.com/tutumcloud/tutum-centos/master/set_root_pw.sh /set_root_pw.sh
ADD https://raw.github.com/tutumcloud/tutum-centos/master/run.sh /run.sh
RUN chmod +x /*.sh

# Add tutum motd
RUN rm -f /etc/motd
ADD http://s.tutum.co/motd /etc/motd

EXPOSE 22
CMD ["/run.sh"]
