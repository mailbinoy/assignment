pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
		sh 'export DEBIAN_FRONTEND=noninteractive'
		sh 'sudo apt-get update'
		sh 'sudo apt-get install -y tzdata'
		sh 'sudo ln -fs /usr/share/zoneinfo/Asia/Kolkata /etc/localtime'
		sh 'sudo dpkg-reconfigure --frontend noninteractive tzdata'
                sh 'sudo apt -y install docker.io awscli'
                sh 'chmod +x build.sh'
		sh './build.sh'
            }
        }
    }
}
