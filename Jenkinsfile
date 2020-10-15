node {
        stage('get compliance image')
        {
           docker.withTool('docker') {  
                docker.withRegistry('https://005901988046.dkr.ecr.ca-central-1.amazonaws.com/','ecr:ca-central-1:aws-instance-role') {
                    docker.image('matter-compliance').inside {
                        stage('checkout code')
                        {
                            git 'https://github.com/rrawla/jenkins-tf.git'
                        }
                        stage('init state')
                        {
                            sh 'terraform -v && terragrunt -v && snitch2 -v'

                            sh 'terraform init'
                        }
                        stage('validate plan') 
                        {
                            sh 'terraform plan -out=tgf.plan'
                            sh 'terraform show -json tgf.plan > tgf.json'
                            sh 'terraform graph > tgf.dot'
                        }
                        stage('run compliance')
                        {
                            sh 'snitch2 static -c snitch.config.yml -p tgf.json -g tgf.dot'
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
