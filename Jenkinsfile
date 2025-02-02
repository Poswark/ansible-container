pipeline {
    agent any
    options {
        buildDiscarder(logRotator(numToKeepStr: '10'))
        timeout(time: 5, unit: 'MINUTES')
        ansiColor('xterm')
    }
    parameters {
        choice(name: 'profile', choices: ['dev', 'uat', 'prd'], description: 'Ambiente')
    }
    triggers {
        cron('0 7 * * *')
    }
    
    stages {
        stage('Clonar repositorio') {
            steps {
                script {
                    retry(3) {
                        git branch: 'trunk', url: 'https://github.com/Poswark/ansible-container.git'
                    }
                }
            }
        }
        stage('Ejecutar contenedor de Ansible') {
            steps {
                withCredentials([file(credentialsId: 'ansible-key-pem', variable: 'ANSIBLE_PEM')]) {
                    script {
                        sh '''
                            docker run --rm \
                                -v $(pwd)/playbooks:/ansible/playbooks \
                                -v $ANSIBLE_PEM:/root/.ssh/boxung.pem:ro \
                                -e ANSIBLE_FORCE_COLOR=1 \
                                -e ANSIBLE_PRIVATE_KEY_FILE=/root/.ssh/boxung.pem \
                                -e ANSIBLE_PROFILE=${profile} \
                                poswark/ansible-container:0.0.2 \
                                ansible-playbook \
                                -i /ansible/playbooks/inventory.ini \
                                /ansible/playbooks/playbook.yml 
                        '''
                    }
                }
            }
        }
    }
    post {
        always {
            script {
                // Limpieza de Docker y del workspace
                sh '''
                    docker builder prune -f
                '''
                cleanWs()
            }
        }
    }
}