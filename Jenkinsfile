pipeline {
    agent any
    stages {
        stage('Build') {
            agent {
                docker {
                    image 'ubuntu'
                    args '-v $HOME/assignment:/home/ubuntu/assignment'
                    // Run the container on the node specified at the
                    // top-level of the Pipeline, in the same workspace,
                    // rather than on a new node entirely:
                    reuseNode true
                }
            }
            steps {
                sh 'cd /home/ubuntu/assignment'
                sh 'sudo apt install docker'
                sh 'sudo apt install aws-cli'
                sh 'ls'
            }
        }
    }
}
