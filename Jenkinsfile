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
                
                discordSend description: "Server SUCCESS to Deploy/Destroy", footer: "Server-Deploy-CI/CD Success", notes: "Server IP ${sh(returnStdout: true, script: 'cat /root/tfstate/digital-ocean-servers.tfstate | jq \'.["outputs"]["ips"]["value"]\'')}",  link: env.BUILD_URL, result: currentBuild.currentResult, title: JOB_NAME, webhookURL: env.SOCAAS_WEBHOOK
            }
        }
    }
    post {
        failure {
            discordSend description: "Server FAILED to Deploy/Destroy", footer: "Server-Deploy-CI/CD Failed", notes: "Log: ${currentBuild.rawBuild.getLog(20)}", link: env.BUILD_URL, result: currentBuild.currentResult, title: JOB_NAME, webhookURL: env.SOCAAS_WEBHOOK
        }
    }  
}
