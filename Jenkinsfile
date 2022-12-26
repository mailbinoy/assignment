pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'chmod +x build.sh'
                sh './build.sh'
            }
        }
    
    stage ('Deploy') {
        steps{
		sshagent(credentials : ['pipeline_ssh']) {
	            sh 'scp  -o StrictHostKeyChecking=no deploy.sh ubuntu@$app_host:'
	            sh 'ssh -o StrictHostKeyChecking=no -l ubuntu $app_host chmod +x /home/ubuntu/deploy.sh'
	            sh 'ssh -o StrictHostKeyChecking=no -l ubuntu $app_host /home/ubuntu/deploy.sh'
	            }
            }
        }
    } 
}
