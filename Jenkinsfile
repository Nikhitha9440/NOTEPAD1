pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                echo "Building Docker Image"
                sh "docker build -t notepad:v1 ."
            }
        }

        stage('Docker Login') {
            steps {
                echo "Logging into Docker Hub"
                sh 'echo docker login -u nikhitha9440 -p Nikki@0039'
                // More secure command:
                // sh 'echo <DOCKER_PASSWORD> | docker login -u nikhitha --password-stdin'
            }
        }

        stage('Tag & Push Docker Image to Docker Hub') {
            steps {
                echo "Tagging and Pushing Docker Image"
                sh "docker tag notepad:v1 nikhitha9440/notepad:v1"
                sh "docker push nikhitha9440/notepad:v1"
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                echo "Deploying to Kubernetes"
                sh 'kubectl apply -f deployment.yaml --validate=false'
                sh 'kubectl apply -f service.yaml'
            }
        }
    }

    post {
        success {
            echo '✅ Pipeline completed successfully!'
        }
        failure {
            echo '❌ Pipeline failed. Please check the logs.'
        }
    }
}
