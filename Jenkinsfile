<<<<<<< HEAD
pipeline {
    agent any
    stages {
        stage('Deploy to AWS') {
            steps {
                script {
                    withCredentials([[
                        $class: 'AmazonWebServicesCredentialsBinding',
                        credentialsId: 'aws-credentials'
                    ]]) {
                        sh '''
                        aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
                        aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
                        aws s3 ls
                        '''
                    }
                }
            }
        }
    }
}
=======
pipeline{
    agent any
    environment {
        AWS_ACCESS_KEY_ID = aws-credentials('aws-access-key-id')  // This assumes you have stored these as secrets in Jenkins
        AWS_SECRET_ACCESS_KEY = aws-credentials('aws-secret-access-key') // This assumes you have stored these as secrets in Jenkins
    }
    stages{
        stage('CodeScan'){
            steps{
                sh 'trivy fs . -o file.txt'
            }
        }
        stage('TerraformValidate'){
            steps{
                sh 'terraform init'
                sh 'terraform validate'
            
          }
        }
        stage('Plan') {
            steps {
               sh 'terraform plan'
            }
        }
    
    }
    post {
        always {
            echo 'Pipeline execution finished.'
        }

        success {
            echo 'Terraform code validated and scanned successfully.'
        }

        failure {
            echo 'Error in Terraform code or Trivy scan.'
        }
    }
    
}



    

   
>>>>>>> 4fa7cec500213d55f8d2371dfd0bf11505fb513d
