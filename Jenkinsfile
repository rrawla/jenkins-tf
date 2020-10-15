node {
        stage('pull docker image')
        {
           docker.withTool('docker') {  
                docker.withRegistry('https://005901988046.dkr.ecr.ca-central-1.amazonaws.com/','ecr:ca-central-1:aws-instance-role') {
                    docker.image('005901988046.dkr.ecr.ca-central-1.amazonaws.com/matter-compliance').inside {
                        stage('checkout code')
                        git 'https://github.com/rrawla/jenkins-tf.git'
                        stage('initialize infrastructure state')
                        sh 'terraform init'
                        stage('validate plan')
                        sh 'terraform plan'
                        stage('run compliance')
                        sh 'snitch2 static -c snitch.config.yml'
                        stage('deploy')
                        sh 'terraform apply --auto-approve'      
                    }
                }
                
           }
        }  
        
   
}
