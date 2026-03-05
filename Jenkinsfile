pipeline {
    agent any

    environment {
        IMAGE_NAME = "myapp"
        CONTAINER_NAME = "testapp"
        PORT = "3000"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git 'https://github.com/Sjankatti/CICDSAN2.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t %IMAGE_NAME% .'
            }
        }

        stage('Stop Old Container') {
            steps {
                bat '''
                docker stop %CONTAINER_NAME% || exit 0
                docker rm %CONTAINER_NAME% || exit 0
                '''
            }
        }

        stage('Run New Container') {
            steps {
                bat '''
                docker run -d -p %PORT%:%PORT% --name %CONTAINER_NAME% %IMAGE_NAME%
                '''
            }
        }
    }

    post {
        success {
            echo 'Deployment Successful 🚀'
        }
        failure {
            echo 'Build Failed ❌'
        }
    }
}