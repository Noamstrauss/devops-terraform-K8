pipeline {
  agent any

environment {
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
def emailBody = '${JELLY_SCRIPT,template="html_gmail"}'
def emailSubject = "${env.JOB_NAME} - Build# ${env.BUILD_NUMBER}"
}

  stages {
        stage('init') {
            steps {
                sh '''
            terraform init
                   '''
            }
        }

        stage('Terraform Plan') {
            when { anyOf {branch "main";branch "dev";changeRequest()} }
            steps {
                sh '''
                if [ "$BRANCH_NAME" = "main" ] || [ "$CHANGE_TARGET" = "master" ]; then
                    terraform plan -var-file=environments/prod/prod.tfvars
                    echo "terraform plan run at branch" ${BRANCH_NAME}
                else
                    terraform plan -var-file=environments/test/test.tfvars
                    echo "terraform plan run at branch" ${BRANCH_NAME}
                fi
                '''
            }
        }

        stage('Terraform Apply - dev'){
            when { anyOf {branch "dev"} }
            steps {
                sh '''
                terraform apply -auto-approve -var-file=environments/test/test.tfvars
                '''

            }
        }

        stage('Terraform Apply - prod'){
            when { anyOf {branch "master"}; }
            input {
                message "Do you want to proceed for infrastructure provisioning?"
            }
            steps {
                sh '''
                terraform apply -auto-approve -var-file=environments/prod/prod.tfvars
                '''
            }
        }


  }
}

