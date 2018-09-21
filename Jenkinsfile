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
                    echo "Shutdown containers"
                    sh 'docker container stop $(docker container ps -q) || echo "No running container"'
                    echo "removendo containers"
                    sh 'docker container rm $(docker container ps -qa)'
                    echo "Running Container"
                    sh "docker container run -d -p 8090:8080 --name tomcatwebapp-${env.BUILD_ID} tomcatwebapp:${env.BUILD_ID}"
                    echo "Prunando imagens"
                    sh "docker image prune -f"
                }
            }
        }
    }
}