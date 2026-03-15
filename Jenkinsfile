pipeline {
    agent any
    tools{
        maven 'maven-3.9'
    }
    stages{
        stage ("build jar"){
            steps {
                script{
                    echo "building"
                    sh'mvn package'
                }
            }
        }
        stage ("build image"){
            steps {
                script{
                    echo "building the docker image"
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-repo', usernameVariable: 'USER', passwordVariable: 'PWD')])
                    {

                        sh 'docker build -t brajbelivee/demo-java-maven-build:jma-2.0 .'
                        sh "echo $PWD |docker login -u $USER --password-stdin"
                        sh 'docker push brajbelivee/demo-java-maven-build:jma-2.0'
                    }
                }
            }
        }

        stage ("deploy"){
            steps {
                script{
                    echo "deploying the app"
                }   
            }
        }   
    }  
}
