pipeline {
    agent any
    
    // environment {
    //     NODE_HOME = tool name: 'NodeJS_16' // Ensure Node.js is installed in Jenkins under Global Tool Configuration
    //     PATH = "${NODE_HOME}/bin:${env.PATH}"
    //     DEPLOY_SERVER = 'your-remote-server-ip'  // Replace with your server IP
    //     DEPLOY_USER = 'your-ssh-username'       // SSH user for your server
    //     DEPLOY_PATH = '/var/www/your-app'       // Path where the app will be deployed on the server
    // }
    
    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', 
                    url: 'https://github.com/pratik6813/NodejsApp.git',
                    credentialsId: '97839540-9a9f-4a77-992c-915e0130e51e'  // Optional: only if the repo is private
            }
        }
        
        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }
        
        stage('Run Tests') {
            steps {
                // Run tests (optional, depends on your project)
                sh 'npm test'
            }
        }
        
        stage('Build Application') {
            steps {
                // If there's a build process (e.g., transpiling, bundling), add it here
                // For Node.js, if you're using a build tool like Webpack or Babel:
                sh 'npm run build'
            }
        }
        
        // stage('Deploy to Server') {
        //     steps {
        //         script {
        //             // Copy files to the remote server using SCP or rsync
        //             sh """
        //             ssh -o StrictHostKeyChecking=no ${DEPLOY_USER}@${DEPLOY_SERVER} 'mkdir -p ${DEPLOY_PATH}'
        //             rsync -avz --exclude node_modules/ . ${DEPLOY_USER}@${DEPLOY_SERVER}:${DEPLOY_PATH}
        //             """

        //             // Install dependencies on the remote server and restart the application
        //             sh """
        //             ssh -o StrictHostKeyChecking=no ${DEPLOY_USER}@${DEPLOY_SERVER} '
        //             cd ${DEPLOY_PATH} && 
        //             npm install --production && 
        //             pm2 restart all || pm2 start server.js --name "your-app-name"'
        //             """
        //         }
        //     }
        // }
    }


}
