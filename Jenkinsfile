pipeline {
    agent any
    stages {
        stage('Build') {
            agent {
                docker {
                    image 'ubuntu'
                    args '-v $HOME/assignment:/root/assignment -u 0' 
                    // Run the container on the node specified at the
                    // top-level of the Pipeline, in the same workspace,
                    // rather than on a new node entirely:
                    reuseNode true
                }
            }
            steps {
		sh 'export DEBIAN_FRONTEND=noninteractive'
                sh 'cd /root/assignment'
		sh 'apt update'
                sh 'DEBIAN_FRONTEND=noninteractive;TZ=Etc/UTC ; apt -y install docker awscli'
                sh 'ls'
            }
        }
    }
}
