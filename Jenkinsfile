pipeline{
    agent any
    stages{
        stage("checkout"){
            steps{
                checkout scm
            }
        }

        stage("Test"){
            steps{
                sh 'sudo npm install's
            }
        }

        stage("build"){
            steps{
                sh 'npm run build'
            }
        }
    }
}