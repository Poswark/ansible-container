pipeline {
    agent any

    stages {
        stage('Clonar repositorio') {
            steps {
                git branch: 'feature/integration-jenkins', url: 'https://github.com/Poswark/ansible-container.git'
            }
        }

        // stage('Ejecutar contenedor de Ansible') {
        //     steps {
        //         script {
        //             sh '''
        //                 docker run --rm \
        //                 -v $(pwd)/playbooks:/ansible/playbooks \
        //                 ansible-container \
        //                 -i /ansible/playbooks/inventory.ini \
        //                 /ansible/playbooks/playbook.yml
        //             '''
        //         }
        //     }
        // }
    }
}