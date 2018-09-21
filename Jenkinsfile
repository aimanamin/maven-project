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
        }
    }
}