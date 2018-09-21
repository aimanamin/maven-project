pipeline {
    agent any
    tools {
        maven "localMaven"
        jdk   "localJDK"
    }
    stages{
        stage("Build"){
            steps{
                sh 'mvn clean package'
                echo "Pacote creado"
            }
            post {
                success {
                    echo "Now Archiving ..."
                    archiveArtifacts artifacts: '**/target/*.war'
                }
            }
        }
    }
    stage("Build image") {
        app = docker.build(".")
    }
}