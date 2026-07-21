pipeline {
    agent any

    environment {
        AWS_REGION = 'ap-south-1'
        AWS_ACCOUNT_ID = '747582940940'
        ECR_REPOSITORY = 'wandernest'
        IMAGE_TAG = 'latest'
        ECR_URI = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPOSITORY}"
    }

    stages {

        stage('Clone Repository') {
            steps {
                checkout scm
            }
        }

        stage('Generate Password') {
            steps {
                sh './generate_password.sh'
            }
        }

        stage('Show Password') {
            steps {
                sh 'cat roles/webserver/files/password.txt'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t wandernest-app:${IMAGE_TAG} .'
            }
        }

        stage('Login to Amazon ECR') {
            steps {
                sh '''
                aws ecr get-login-password --region $AWS_REGION | \
                docker login --username AWS --password-stdin $ECR_URI
                '''
            }
        }

        stage('Tag Docker Image') {
            steps {
                sh '''
                docker tag wandernest-app:${IMAGE_TAG} \
                $ECR_URI:${IMAGE_TAG}
                '''
            }
        }

        stage('Push Docker Image to Amazon ECR') {
            steps {
                sh '''
                docker push $ECR_URI:${IMAGE_TAG}
                '''
            }
        }

        stage('Verify Docker Images') {
            steps {
                sh 'docker images'
            }
        }
    }

    post {
        success {
            echo 'Docker image successfully pushed to Amazon ECR!'
        }

        failure {
            echo 'Pipeline failed!'
        }
    }
}
