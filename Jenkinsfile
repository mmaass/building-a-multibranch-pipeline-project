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
        stage('Deliver for development') {
            when {
                branch 'development'
            }
            steps {
                sh './jenkins/scripts/deliver-for-development.sh'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                sh './jenkins/scripts/kill.sh'
            }
        }
        stage('Deploy for production') {
            when {
                branch 'production'
            }
            steps {
                sh './jenkins/scripts/deploy-for-production.sh'
                sshPublisher(publishers: [sshPublisherDesc(configName: 'mederp prod', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: './foo/foo.sh', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: 'foo', remoteDirectorySDF: false, removePrefix: '', sourceFiles: 'build/**,jenkins/scripts/foo.sh')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
            }
        }
    }
}
