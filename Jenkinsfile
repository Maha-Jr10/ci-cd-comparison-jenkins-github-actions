pipeline {
    agent any
    
    stages {
        stage('Hello') {
            steps {
                echo '🎉 Hello from Jenkins!'
                echo "Build Number: ${env.BUILD_NUMBER}"
                echo "Job Name: ${env.JOB_NAME}"
            }
        }
        
        stage('System Info') {
            steps {
                sh 'echo "Running on: $HOSTNAME"'
                sh 'uname -a'
                sh 'whoami'
            }
        }
        
        stage('Workspace') {
            steps {
                sh 'pwd'
                sh 'ls -la'
            }
        }
        
        stage('Success') {
            steps {
                echo '✅ All stages completed successfully!'
                echo '🎯 Jenkins is working perfectly!'
            }
        }
    }
    
    post {
        always {
            echo '📊 Build completed!'
        }
        success {
            echo '🎉 SUCCESS! Jenkins is configured correctly!'
        }
        failure {
            echo '❌ Build failed - check logs'
        }
    }
}
