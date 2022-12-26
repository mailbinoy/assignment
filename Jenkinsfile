pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'chmod +x build.sh'
                sh './build.sh'
            }
        }
    }
    stage ('Deploy') {
        steps{
         sshagent(credentials : ['pipeline_ssh']) {
		    sh 'echo Logging to ECR...'
            sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 223316186016.dkr.ecr.us-east-1.amazonaws.com'
            sh 'docker run -d -p 80:8081 223316186016.dkr.ecr.us-east-1.amazonaws.com/assignment:latest'
            
                }
            }
        } 
}
