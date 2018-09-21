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
                script {
                    docker.build "tomcatwebapp:${env.BUILD_ID}"
                }
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