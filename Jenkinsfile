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
        stage("Build Dockerfile"){
            agent {
                dockerfile {
                    dir .
                    label "tomcatwebapp:${env.BUILD_ID}"
                }
            }
            steps{
                echo "Running container"
                sh "docker container run -d -p 8090:8080 --mame tomcatwebapp:${env.BUILD_ID} tomcatwebapp:${env.BUILD_ID}"
            }
        }
    }
}