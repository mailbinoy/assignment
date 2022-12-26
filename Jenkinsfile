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
		sh 'apt-get update'
		sh 'apt-get install -y tzdata'
		sh 'ln -fs /usr/share/zoneinfo/Asia/Kolkata /etc/localtime'
		sh 'dpkg-reconfigure --frontend noninteractive tzdata'
                sh 'apt -y install docker awscli'
                sh 'chmod +x build.sh'
		sh './build.sh'
            }
        }
    }
}
