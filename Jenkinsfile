pipeline {
    agent any
    triggers {
        cron('0 7 * * *')
    }
    stages {
        stage('Clonar repositorio') {
            steps {
                script{ 
                    retry(3) {
                        git branch: 'trunk', url: 'https://github.com/Poswark/ansible-container.git'
                        }
                    }
                }
            }
        

        stage('Ejecutar contenedor de Ansible') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'ansible-creds', usernameVariable: 'ANSIBLE_USER', passwordVariable: 'ANSIBLE_PASS')]) {
                    script {    
                        wrap([$class: 'AnsiColorBuildWrapper', colorMapName: 'xterm']) {
                            sh '''
                                docker run --rm \
                                -v $(pwd)/playbooks:/ansible/playbooks \
                                -e ANSIBLE_FORCE_COLOR=1 \
                                -e ANSIBLE_USER=$ANSIBLE_USER \
                                -e ANSIBLE_PASS=$ANSIBLE_PASS \
                                poswark/ansible-container:0.0.1 \
                                ansible-playbook \
                                -i /ansible/playbooks/inventory.ini \
                                /ansible/playbooks/playbook.yml \
                                --extra-vars "ansible_user=${ANSIBLE_USER} ansible_password=${ANSIBLE_PASS}" 

                            '''
                        }
                    }
                }
            } 
        }
    }
}
