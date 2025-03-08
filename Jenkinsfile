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
                withCredentials([usernamePassword(credentialsId: 'aws-credentials', 
                                                    usernameVariable: 'AWS_ACCESS_KEY_ID', 
                                                    passwordVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                    // Set AWS credentials as environment variables to be used in Terraform commands
                sh 'echo $AWS_ACCESS_KEY_ID'
                sh 'echo $AWS_SECRET_ACCESS_KEY'
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



    

   