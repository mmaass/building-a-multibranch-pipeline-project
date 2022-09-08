pipeline {
    agent {
        docker {
            image 'node:6-alpine'
            args '-p 3001:3000 -p 5001:5000'
        }
    }
    environment {
        CI = 'true'
        NPM_CONFIG_CACHE = "${WORKSPACE}/.npm"
        HOME = "${WORKSPACE}"
    }
    stages {
        stage('Build') {
            steps {
                sh 'npm install'
            }
        }
        stage('Test') {
            steps {
                sh './jenkins/scripts/test.sh'
            }
        }
    }
}
