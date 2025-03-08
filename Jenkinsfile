pipeline {
    agent any
    stages {
        stage('connect to AWS') {
            steps {
                script {
                    withCredentials([[
                        $class: 'AmazonWebServicesCredentialsBinding',
                        credentialsId: 'aws-credentials'
                    ]]) {
                        sh '''
                        aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
                        aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
                        '''
                    }
                }
            }
        }
        stage('ScanCode'){
            steps{
                sh 'trivy fs . -o file.txt'
                sh 'cat file.txt'
                
            }
        }
        stage('TerraformValidate'){
            steps{
                sh 'terraform init'
                sh 'terraform validate'
            }
        }
        stage('Plan'){
            steps{
                sh 'terraform fmt'
                sh 'terraform plan'
            }
        }
        stage('ApplyCode'){
            steps{
                sh 'terraform apply --auto-approve'
                
            }
        }
        stage('DestroyCode'){
            steps{
                sh 'terraform destroy --auto-approve'
                
            }
        }

    }
}

