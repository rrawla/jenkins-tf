node {
        stage('pull docker image')
        {
           docker.withTool('docker') {  
                docker.withRegistry('https://005901988046.dkr.ecr.ca-central-1.amazonaws.com/','ecr:ca-central-1:aws-instance-role') {
                    sh 'docker pull 005901988046.dkr.ecr.ca-central-1.amazonaws.com/matter-compliance:latest'
                }
           }
        }  
        // stage('checkout') {
        //         git 'https://github.com/rrawla/jenkins-tf.git'
        // }
        // stage('init') {
        //         nodejs('node')
        //         {
        //              sh 'aws s3 cp s3://rahul.jenkins.test/snitch2-0.5.1.tgz .'             
        //              sh 'npm install --unsafe-perm -g snitch2-0.5.1.tgz'                   
        //         }
        //         sh 'terraform init'    
        // }
        // stage('compliance check') {
        //        nodejs('node') {
        //             sh 'snitch2 static -c ./snitch.config.yml'
        //         }                
        // }
        // stage('apply') {
        //         sh 'terraform apply --auto-approve' 
        // }
   
}
