pipeline {
    agent any

    stages {
        stage('build') {
            steps {
                echo 'building the application'
                echo 'testing multi branch and normal pipeline both'
                echo "testing feature payment branch commits"
            }
        }
        stage('test') {
            steps {
                echo 'testing the app'
            }
        }
         stage('deploy') {
            steps {
                echo 'deploying the appn'
            }
        }
    }
}
