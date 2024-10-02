# Utiliza Universal Base Image de Red Hat (UBI)
FROM registry.access.redhat.com/ubi8/ubi:latest

# Instala dependencias necesarias para X11 y Ansible
RUN yum -y update && \
    yum install -y openssh-server \
    sudo \
    which \
    && yum clean all

# Crea un usuario sin privilegios para conectarte
RUN useradd -ms /bin/bash remoteuser && \
    echo 'remoteuser ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Habilita SSH
RUN mkdir /var/run/sshd
RUN ssh-keygen -A

# Configura el servidor SSH para aceptar conexiones X11
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config && \
    echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config

# Establece contraseña para el usuario (se puede cambiar)
RUN echo 'remoteuser:password' | chpasswd

# Expone los puertos de SSH y X11
EXPOSE 22

# Inicia SSH cuando el contenedor arranque
CMD ["/usr/sbin/sshd", "-D"]