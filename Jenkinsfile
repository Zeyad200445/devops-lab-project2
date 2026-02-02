pipeline {
    agent any

    environment {
        IMAGE_NAME = "my-python-app"
    }

    stages {
        stage('Checkout') {
            steps {
                // Jenkins automatically pulls code from the Webhook trigger
                echo 'Checking out code...'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    echo 'Building Docker Image...'
                    // Build the image using the Dockerfile in current dir
                    sh "docker build -t ${IMAGE_NAME} ."
                }
            }
        }

        stage('Deploy Container') {
            steps {
                script {
                    echo 'Deploying Application...'
                    // 1. Stop old container if running (ignore error if not exists)
                    sh "docker stop ${IMAGE_NAME} || true"
                    sh "docker rm ${IMAGE_NAME} || true"
                    
                    // 2. Run new container
                    sh "docker run -d -p 5005:5000 --name ${IMAGE_NAME} ${IMAGE_NAME}"
                }
            }
        }
    }
}