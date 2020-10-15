node {
        stage('pull docker image')
        {
           docker.withTool('docker') {  
                docker.withRegistry('https://005901988046.dkr.ecr.ca-central-1.amazonaws.com/','ecr:ca-central-1:aws-instance-role') {
                    docker.image('005901988046.dkr.ecr.ca-central-1.amazonaws.com/matter-compliance').inside {
                        git 'https://github.com/rrawla/jenkins-tf.git'
                        sh 'terraform init -reconfigure'
                        sh 'terraform plan'
                        sh 'snitch2 static -c snitch.config.yml'
                        sh 'terraform apply --auto-approve'      
                    }
                }
                
           }
        }  
        
   
}
