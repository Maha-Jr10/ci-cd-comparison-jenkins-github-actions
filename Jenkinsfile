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

        stage('Run Tests') {
            steps {
                bat 'call test.bat'
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
            // cleanWs() // Optional - uncomment to clean workspace
        }
        success {
            echo '🎉 SUCCESS! Jenkins GitHub integration is working!'
            
            // Add email notification
            emailext (
                subject: "✅ Jenkins Build #${env.BUILD_NUMBER} Success",
                body: """
                <h3>✅ Jenkins Build Success!</h3>
                <p><b>Job:</b> ${env.JOB_NAME}</p>
                <p><b>Build #:</b> ${env.BUILD_NUMBER}</p>
                <p><b>Status:</b> SUCCESS</p>
                <p><b>Duration:</b> ${currentBuild.durationString}</p>
                <p><b>View Build:</b> <a href="${env.BUILD_URL}">${env.BUILD_URL}</a></p>
                <p><b>Git Commit:</b> ${env.GIT_COMMIT}</p>
                <p><b>Workspace:</b> ${env.WORKSPACE}</p>
                """,
                to: 'your.email@gmail.com',  // CHANGE THIS TO YOUR EMAIL
                mimeType: 'text/html'
            )
        }
        failure {
            echo '❌ Build failed'
            emailext (
                subject: "❌ Jenkins Build #${env.BUILD_NUMBER} Failed",
                body: "Build failed! Check ${env.BUILD_URL}",
                to: 'your.email@gmail.com'  // CHANGE THIS
            )
        }
    }
}
