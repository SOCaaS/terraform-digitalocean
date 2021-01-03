pipeline {
    agent none 
    stages {
        stage('Terraform Deployment') {
            agent {
                docker {
                    image 'base/terraform:latest'
                    args  '-v /root/tfstate:/root/tfstate -v /root/tfvars:/root/tfvars'
                }
            }
            steps {
                echo 'Terraform Migration....'
                sh 'terraform --version'
                sh 'terraform init'
                sh 'terraform plan  -var-file=/root/tfvars/digitalocean.tfvars'
                sh 'terraform apply -var-file=/root/tfvars/digitalocean.tfvars --auto-approve'
                echo 'Finished'
            }
        }
    }
    post {
        success {
            discordSend description: "Server Deploy", footer: "Server-Deploy-CI/CD Success", link: env.BUILD_URL, result: currentBuild.currentResult, title: JOB_NAME, webhookURL: env.SOCAAS_WEBHOOK
        }
        failure {
            discordSend description: "Server Deploy", footer: "Server-Deploy-CI/CD Failed", link: env.BUILD_URL, result: currentBuild.currentResult, title: JOB_NAME, webhookURL: env.SOCAAS_WEBHOOK
        }
    }  
}