# Utiliza Universal Base Image de Red Hat (UBI)
FROM registry.access.redhat.com/ubi8/ubi:latest

RUN yum -y update && \
    yum install -y openssh-server \
    sudo \
    which \
    && yum clean all

RUN useradd -ms /bin/bash remoteuser && \
    echo 'remoteuser ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Habilita SSH
RUN mkdir /var/run/sshd
RUN ssh-keygen -A

RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config && \
    echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config

RUN echo 'remoteuser:password' | chpasswd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]