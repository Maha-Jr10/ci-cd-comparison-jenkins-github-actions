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
                    echo '🔍 Checking system information...'
                    
                    // Windows commands
                    bat 'echo ==== WINDOWS SYSTEM INFO ===='
                    bat 'ver'
                    bat 'echo User: %USERNAME%'
                    bat 'echo Computer: %COMPUTERNAME%'
                    bat 'echo Processor Count: %NUMBER_OF_PROCESSORS%'
                    bat 'echo Architecture: %PROCESSOR_ARCHITECTURE%'
                    
                    // Alternative: Use PowerShell for better info
                    bat 'powershell -Command "Get-CimInstance Win32_OperatingSystem | Select-Object Caption, Version | Format-List"'
                }
            }
        }
        
        stage('Workspace Check') {
            steps {
                script {
                    bat 'echo ==== WORKSPACE CONTENTS ===='
                    bat 'dir /B'
                    bat 'echo Workspace path: %CD%'
                    
                    // List files with details
                    bat 'dir'
                }
            }
        }
        
        stage('Git Test') {
            steps {
                script {
                    bat 'echo ==== GIT INFORMATION ===='
                    bat 'git --version'
                    bat 'git log --oneline -3'
                    bat 'git remote -v'
                }
            }
        }
        
        stage('Success') {
            steps {
                echo '✅ All stages completed successfully!'
                echo '🎯 Jenkins is working perfectly with GitHub!'
                bat 'echo Time: %TIME%'
            }
        }
    }
    
    post {
        always {
            echo '📊 Build completed!'
            // Optional cleanup - uncomment if you want
            // cleanWs()
        }
        success {
            echo '🎉 SUCCESS! Jenkins GitHub integration is working!'
            echo ' '
            echo '📈 Next steps:'
            echo '1. Add email notifications'
            echo '2. Add automated tests'
            echo '3. Set up GitHub webhooks for auto-trigger'
            echo '4. Try building a real application'
        }
        failure {
            echo '❌ Build failed'
            echo 'Check the stage that failed above'
        }
    }
}
