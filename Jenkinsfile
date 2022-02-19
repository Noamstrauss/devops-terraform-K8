 pipeline {
        agent any

 stages {
    stage('init') {
        steps {
            sh '''
            terraform init
            '''
                        }
                    }
                  }
      post {
        failure {
            echo 'init Failed '
            emailext(mimeType: 'text/html', replyTo: 'nds597@walla.com', subject: emailSubject, to: 'nds597@walla.com', body: emailBody)
        }
    }
 }