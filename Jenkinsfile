pipeline {
    agent any
    tools {
          git 'git'
          terraform 'terraform'
        }
    stages {
        
        stage('checkout') {
            steps {
                git 'https://github.com/rrawla/jenkins-tf.git'
            }
        }
        stage('init') {
            withAWS(role:'pipeline-services-terraform', roleAccount:"005901988046", duration: 900, roleSessionName: 'jenkins-session')
            {
              sh 'terraform init'    
            }
        }
        stage('validate') {
            steps {
                nodejs('node') {
                    sh 'aws s3 cp s3://rahul.jenkins.test/snitch2-0.5.1.tgz .'
                    sh 'npm install --unsafe-perm -g snitch2-0.5.1.tgz'
                    sh 'snitch2 static -c ./snitch.config.yml'
                }
                
            }
        }
        
        stage('apply') {
            steps {
                sh 'terraform apply --auto-approve'         
            }
        }
    }
}
