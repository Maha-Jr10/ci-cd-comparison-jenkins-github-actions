pipeline {
    agent any
    
    stages {
        stage('Hello') {
            steps {
                echo '🎉 Hello from Jenkins!'
                echo "Build Number: ${env.BUILD_NUMBER}"
                echo "Job Name: ${env.JOB_NAME}"
                echo "Workspace: ${env.WORKSPACE}"
            }
        }
        
        stage('System Info') {
            steps {
                script {
                    // Windows specific commands
                    if (isUnix()) {
                        sh 'echo "Running on Unix/Linux"'
                        sh 'uname -a'
                        sh 'whoami'
                    } else {
                        bat 'echo "Running on Windows"'
                        bat 'systeminfo | findstr /C:"OS Name" /C:"OS Version"'
                        bat 'echo Username: %USERNAME%'
                    }
                }
            }
        }
        
        stage('Workspace Check') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'pwd'
                        sh 'ls -la'
                    } else {
                        bat 'echo Current directory: %CD%'
                        bat 'dir'
                    }
                }
            }
        }
        
        stage('Git Test') {
            steps {
                script {
                    echo 'Testing Git integration...'
                    if (isUnix()) {
                        sh 'git --version'
                        sh 'git log --oneline -5'
                    } else {
                        bat 'git --version'
                        bat 'git log --oneline -5'
                    }
                }
            }
        }
        
        stage('Success') {
            steps {
                echo '✅ All stages completed successfully!'
                echo '🎯 Jenkins is working perfectly with GitHub!'
                echo '📦 Build artifacts can be archived here'
            }
        }
    }
    
    post {
        always {
            echo '📊 Build completed! Cleaning up...'
            cleanWs() // Optional: Cleans workspace after build
        }
        success {
            echo '🎉 SUCCESS! Jenkins is configured correctly!'
            echo 'Next steps:'
            echo '1. Add email notifications'
            echo '2. Add automated tests'
            echo '3. Set up webhooks for auto-trigger'
        }
        failure {
            echo '❌ Build failed - check logs above'
            echo 'Common issues:'
            echo '- Git not installed on Jenkins server'
            echo '- Network connectivity to GitHub'
            echo '- Jenkins plugins missing'
        }
    }
}
