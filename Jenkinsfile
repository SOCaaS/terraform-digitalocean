pipeline {
    agent none 
    options {
        ansiColor('xterm')
    }
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
                sh 'terraform show'
                echo 'Finished'
                discordSend description: "Server IP", notes: sh(returnStdout: true, script: 'cat /root/tfstate/digital-ocean-servers.tfstate | jq \'.["outputs"]["ips"]["value"]\''),  link: env.BUILD_URL, result: currentBuild.currentResult, title: JOB_NAME, webhookURL: env.SOCAAS_WEBHOOK
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