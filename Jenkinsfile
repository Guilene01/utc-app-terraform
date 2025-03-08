pipeline{
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-access-key-id')  // This assumes you have stored these as secrets in Jenkins
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key') // This assumes you have stored these as secrets in Jenkins
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



    

   