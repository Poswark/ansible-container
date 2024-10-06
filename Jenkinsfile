pipeline {
    agent any

    stages {
        stage('Clonar repositorio') {
            steps {
                // Clonar la rama feature/integration-jenkins del repositorio
                git branch: 'feature/integration-jenkins', url: 'https://github.com/Poswark/ansible-container.git'
            }
        }

        stage('Ejecutar contenedor de Ansible') {
            steps {
                script {
                    // Aplicar colores ANSI en la consola de Jenkins
                    wrap([$class: 'AnsiColorBuildWrapper', colorMapName: 'xterm']) {
                        sh '''
                            docker run --rm \
                            -v $(pwd)/playbooks:/ansible/playbooks \
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