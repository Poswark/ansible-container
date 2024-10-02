
docker run --rm -v $(pwd)/playbooks:/ansible/playbooks ansible-container -i /ansible/playbooks/inventory.ini /ansible/playbooks/playbook.yml