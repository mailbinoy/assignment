pipeline {
    agent any

    stages {
        stage ('Build') {
    steps{
        sshagent(credentials : ['pipeline_ssh']) {
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@10.0.2.184 git clone https://github.com/mailbinoy/assignment.git'
		sh 'cd assignment'
		sh './build.sh'
                }
            }
        }
    }
}
