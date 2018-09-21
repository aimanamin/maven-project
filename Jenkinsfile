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
        post{
            success {
                sh "docker run -p 8090:8080 --name tomcatwebapp:${env.BUILD_ID} --alias tomcatwebapp tomcatwebapp:${env.BUILD_ID}"
            }
        }
    }
}