pipeline {
    agent any
    tools {
        maven "localMaven"
        jdk   "localJDK"
        Docker "localDOCKER"
    }
    stages{
        stage("Build"){
            steps{
                sh 'mvn clean package'
                echo "Pacote creado"
                sh "docker build . -t tomcatwebapp:${env.BUILD_ID}"
            }
            post {
                success {
                    echo "Now Archiving ..."
                    archiveArtifacts artifacts: '**/target/*.war'
                }
            }
        }
    }
}