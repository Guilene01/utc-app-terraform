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



    

   