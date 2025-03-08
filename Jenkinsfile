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

    }
}