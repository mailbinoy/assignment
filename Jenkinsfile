pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
		sh 'export DEBIAN_FRONTEND=noninteractive'
		sh 'apt-get update'
		sh 'apt-get install -y tzdata'
		sh 'ln -fs /usr/share/zoneinfo/Asia/Kolkata /etc/localtime'
		sh 'dpkg-reconfigure --frontend noninteractive tzdata'
                sh 'apt -y install docker.io awscli'
                sh 'chmod +x build.sh'
		sh './build.sh'
            }
        }
    }
}
