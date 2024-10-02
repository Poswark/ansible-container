FROM ubuntu:20.04

# Establecer el entorno para que no pida interacciones durante la instalación
ENV DEBIAN_FRONTEND=noninteractive

# Actualizar paquetes e instalar Ansible y otras dependencias necesarias
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-add-repository --yes --update ppa:ansible/ansible && \
    apt-get install -y ansible sshpass bash && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Crear un directorio para tus playbooks
WORKDIR /ansible

# Copiar tus playbooks al contenedor
COPY ./playbooks /ansible/playbooks
# Establecer el comando por defecto para ejecutar un playbook
#ENTRYPOINT ["ansible-playbook"]