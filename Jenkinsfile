pipeline {
    agent none 
    stages {
        stage('Terraform Deployment') {
            agent {
                docker {
                    image 'base/terraform:latest'
                    args  '-v /root/tfstate/:/root/tfstate/'
                }
            }
            steps {
                echo 'Terraform Migration....'
                sh 'terraform --version'
                sh 'ls /root/tfstate/'
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