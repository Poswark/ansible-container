FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Install packcage and ansible 
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-add-repository --yes --update ppa:ansible/ansible && \
    apt-get install -y ansible sshpass bash && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# dir ansible
WORKDIR /ansible
COPY ./playbooks /ansible/playbooks
