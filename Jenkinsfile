pipeline {
    agent any
    stages {
        stage('Build') {
            agent {
                docker {
                    image 'ubuntu'
                    args '-v $HOME/assignment:/home/ubuntu/assignment'
                    args '-u 0'
                    // Run the container on the node specified at the
                    // top-level of the Pipeline, in the same workspace,
                    // rather than on a new node entirely:
                    reuseNode true
                }
            }
            steps {
                sh 'cd /home/ubuntu/assignment'
		sh 'apt update'
                sh 'apt -y install docker aws-cli'
                sh 'ls'
            }
        }
    }
}
