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

                script{
                    echo "building the app"
                    sh'mvn clean package'
                }

            }
        }

        stage ("build image"){
            steps {

                echo 'building the image'

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
                    def dockerComposeCmd= "docker compose -f docker-compose.yaml up --detach"
                    //def dockerCmd = "docker run -p 8080:8080 -d brajbelivee/demo-java-maven-build:${IMAGE_NAME}"
                    sshagent(['ssh-agent-keys']) {
                        sh "scp docker-compose.yaml ubuntu@16.171.172.111:/home/ubuntu"
                        sh "ssh -o StrictHostKeyChecking=no ubuntu@16.171.172.111 ${dockerComposeCmd}"
                        //sh "ssh -o StrictHostKeyChecking=no ubuntu@16.171.172.111 ${dockerCmd}" 
                    }
                }
            }
        }
        stage("github commit bump"){
            steps{
                script{
                    withCredentials([usernamePassword(credentialsId:'github_us_w_tok', usernameVariable:'USER',passwordVariable:'PASS')]){
                        sh 'git config --global user.email "jenkins@example.com"'
                        sh 'git config --global user.name "jenkins"'


                        sh 'git status'
                        sh 'git branch'
                        sh 'git config --list'

                        sh "git remote set-url origin https://${USER}:${PASS}@github.com/braj-belivee/java-maven-build-.git"
                        sh 'git add .'
                        sh 'git commit -m "updating vesion pom.xml in git"'
                        sh "git push https://${USER}:${PASS}@github.com/braj-belivee/java-maven-build-.git HEAD:master"

                    }
                }
            }
        }
    }
}
