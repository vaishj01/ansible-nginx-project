pipeline {
    agent any

    environment {
        AWS_REGION       = 'ap-south-1'
        AWS_ACCOUNT_ID   = '512902043128'
        ECR_REPOSITORY   = 'wandernest'
        IMAGE_TAG        = 'latest'
        ECR_URI          = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPOSITORY}"
        K8S_NAMESPACE    = 'wandernest'
        K8S_DEPLOYMENT   = 'wandernest-deployment'
        K8S_CONTAINER    = 'wandernest-container'
    }

    stages {

        stage('Clone Repository') {
            steps {
                checkout scm
            }
        }

        stage('Generate Password') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'aws-jenkins-creds'
                ]]) {
                    sh './generate_password.sh'
                }
            }
        }

        stage('Verify Password File Exists') {
            steps {
                sh 'test -f roles/webserver/files/password.txt && echo "Password file created."'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t wandernest-app:${IMAGE_TAG} .'
            }
        }

        stage('Login to Amazon ECR') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'aws-jenkins-creds'
                ]]) {
                    sh '''
                    aws ecr get-login-password --region $AWS_REGION | \
                    docker login --username AWS --password-stdin $ECR_URI
                    '''
                }
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
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'aws-jenkins-creds'
                ]]) {
                    sh 'docker push $ECR_URI:${IMAGE_TAG}'
                }
            }
        }

        stage('Verify Docker Images') {
            steps {
                sh 'docker images'
            }
        }

        stage('Deploy to EKS') {
            steps {
                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-jenkins-creds'],
                    file(credentialsId: 'kubeconfig-creds', variable: 'KUBECONFIG')
                ]) {
                    sh '''
                    kubectl set image deployment/${K8S_DEPLOYMENT} \
                      ${K8S_CONTAINER}=$ECR_URI:${IMAGE_TAG} \
                      --namespace=${K8S_NAMESPACE}
                    kubectl rollout status deployment/${K8S_DEPLOYMENT} --namespace=${K8S_NAMESPACE}
                    '''
                }
            }
        }
    }

    post {
        success {
            echo 'Docker image successfully pushed to ECR and deployed to EKS!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}