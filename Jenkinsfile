pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'pratik6813/nodeapp'
        DOCKER_CREDENTIALS_ID = 'Pratik@6813' // Jenkins credentials ID for Docker Hub
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Checkout the code from the repository
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    def app = docker.build(DOCKER_IMAGE)
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    // Run tests inside the Docker container
                    docker.image(DOCKER_IMAGE).inside {
                        sh 'npm install' // Install dependencies
                        sh 'npm test'    // Run your tests
                    }
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Push the Docker image to Docker Hub
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_CREDENTIALS_ID) {
                        app.push("${env.BUILD_NUMBER}") // Push with build number tag
                        app.push("latest")               // Push with latest tag
                    }
                }
            }
        }

        stage('Cleanup') {
            steps {
                script {
                    // Optional: Clean up old images if needed
                    sh "docker rmi ${DOCKER_IMAGE}:${env.BUILD_NUMBER} || true"
                    sh "docker rmi ${DOCKER_IMAGE}:latest || true"
                }
            }
        }
    }

    post {
        always {
            // Clean up workspace after build
            cleanWs()
        }
    }
}