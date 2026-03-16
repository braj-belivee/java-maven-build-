pipeline {
    agent any
    tools{
        maven 'maven-3.9'
    }
    stages{
        stage('increment version'){
            steps{
                script{
     
                    echo "incrementing app version"
                    sh 'mvn  build-helper:parse-version versions:set \
                    -DnewVersion=\\\${parsedVersion.majorVersion}.\\\${parsedVersion.minorVersion}.\\\${parsedVersion.nextIncrementalVersion} versions:commit'
                    
                    def matcher = readFile('pom.xml') =~ '<version>(.+)</version>'
                    def version = matcher[0][1]
                    env.IMAGE_NAME = "$version-$BUILD_NUMBER"

                }
            }
        }
        stage ("build jar"){
            steps {

                echo 'building the application'
                echo 'testing multi branch and normal pipeline both'
                echo "testing feature payment branch commits"

                script{
                    echo "building the app"
                    sh'mvn clean package'
                }

            }
        }

        stage ("build imgae"){
            steps {

                echo 'testing the app'

                script{
                    echo "building the docker image"
                    withCredentials([usernamePassword(credentialsId:'docker-hub-repo', usernameVariable:'USER',passwordVariable:'PWD')])
                    {
                        sh "docker build -t brajbelivee/demo-java-maven-build:${IMAGE_NAME} ."
                        sh "echo $PWD |docker login -u $USER --password-stdin"
                        sh "docker push brajbelivee/demo-java-maven-build:${IMAGE_NAME}"

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
