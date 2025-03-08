pipeline{
    agent any
    stages{
        stage('CodeScan'){
            steps{
                sh 'trivy fs . -o file.txt'
            }
        }
        stage('TerraformValidate'){
            steps{
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-credentials']]) {
                sh 'echo $AWS_ACCESS_KEY_ID'  // Display AWS Access Key ID for debugging
                sh 'terraform init'
                sh 'terraform validate'
            }
          }
        }
        stage('Plan') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-credentials']]) {
                    // AWS credentials will be injected as environment variables
                sh 'terraform plan'
            }
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



    

   