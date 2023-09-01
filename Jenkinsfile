pipeline {
  agent any

  environment {
    AUTHOR = "iModStyle"
    EMAIL = "donnyrahardika@gmail.com"
    }

  stages {
    stage('Stage 1') {
      steps {
        echo 'Hello world!' 
      }
      }
    stage('Stage 2') {
      steps {
        echo 'Hello stage 2'
      }
  }

  post {
    always {
      echo "I will always say Hello again!"
    }
    success {
      echo "Yay, success"
    }
    failure {
      echo "Oh no, failure"
    }
    cleanup {
      echo "Don't care success or error"
    }
  }

}
