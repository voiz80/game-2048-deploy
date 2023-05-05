#!/usr/bin/env groovy
pipeline {
    agent any
    environment {
        IMAGE_NAME = 'voiz80/my-repo:game2048-1.0'
        IP_EC2 = '3.121.237.75'
        DOCKERHUB_CREDENTIALS = credentials('docker-hub-repo')
    }
    stages {
        stage ('build') {
            steps {
                script {
                 sh "docker build -t ${IMAGE_NAME} ."   
                }
            }
        }
        stage ('login') {
            steps {
                script {
                    sh "echo ${DOCKERHUB_CREDENTIALS_PSW} | docker login -u ${DOCKERHUB_CREDENTIALS_USR} --password-stdin"
                }
            }
        }
        stage ('push') {
            steps {
                script {
                    sh "docker push ${IMAGE_NAME}"
                }
            }
        }
       stage ('deploy') {
            steps {
                script {
                   echo 'deploying docker image to EC2...'

                   def dockerCmd = "docker run -p 80:80 --restart=on-failure -d ${IMAGE_NAME}"
                   def ec2Instance = "ec2-user@${IP_EC2}"

                   sshagent(['ec2-server-key']) {  
                       sh "ssh -o StrictHostKeyChecking=no ${ec2Instance} ${dockerCmd}"
                   }
                }
            }
        } 
    }
}