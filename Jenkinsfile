pipeline {
    agent any

    stages {
        stage('Clonar repositorio') {
            steps {
                git branch: 'feature/integration-jenkins', url: 'trunk'
            }
        }

        stage('Ejecutar contenedor de Ansible') {
            steps {
                script {
                    wrap([$class: 'AnsiColorBuildWrapper', colorMapName: 'xterm']) {
                        sh '''
                            docker run --rm \
                            -v $(pwd)/playbooks:/ansible/playbooks:ro \
                            -e ANSIBLE_FORCE_COLOR=1 \
                            poswark/ansible-container:0.0.1 \
                            ansible-playbook \
                            -i /ansible/playbooks/inventory.ini \
                            /ansible/playbooks/playbook.yml
                        '''
                    }
                }
            } 
        }
    }
}
