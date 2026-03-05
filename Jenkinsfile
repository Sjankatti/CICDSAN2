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

        stage('Start App') {
            steps {
                bat 'npm start'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Stop Old Container') {
            steps {
                script {
                    sh '''
                    docker stop $CONTAINER_NAME || true
                    docker rm $CONTAINER_NAME || true
                    '''
                }
            }
        }

        stage('Run New Container') {
            steps {
                sh '''
                docker run -d -p $PORT:$PORT --name $CONTAINER_NAME $IMAGE_NAME
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