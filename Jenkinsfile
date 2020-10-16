node {
        stage('get compliance image')
        {
           docker.withTool('docker') {  
                docker.withRegistry('https://005901988046.dkr.ecr.ca-central-1.amazonaws.com/','ecr:ca-central-1:aws-instance-role') {
                    docker.image('005901988046.dkr.ecr.ca-central-1.amazonaws.com/matter-compliance:latest').inside {
                        stage('checkout code')
                        {
                            git 'https://github.com/rrawla/jenkins-tf.git'
                        }
                        stage('init check')
                        {
                            sh  'terraform -v'
                            sh  'snitch2 -v'
                            sh  'terraform init --reconfigure'
                            sh  'aws --version'
                        }
                        stage('validate plan') 
                        {
                            sh 'terraform plan -out=tgf.plan'
                            sh 'terraform show -json tgf.plan > tgf.json'
                            sh 'terraform graph > tgf.dot'
                        }
                        stage('pull compliance config')
                        {
                            sh 'aws s3 cp s3://etrade.compliance.configs/compliance.config.yml .'
                        }
                        stage('run compliance')
                        {
                            sh 'snitch2 static -c compliance.config.yml -p tgf.json -g tgf.dot'
                        }
                        stage('deploy')
                        {
                            sh 'terraform apply --auto-approve'
                        }      
                    }
                }
                
           }
        }
       
   
}
