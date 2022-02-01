pipeline {
    agent any
    stages {
        stage('BUILD') {
        	agent {
        		docker { 
        			image 'azul/zulu-openjdk:17.0.2' 
        			reuseNode true
        		}
    		}

            steps {  
                git branch: "${branch}", url: 'https://github.com/YosubLee/memo.git'
                sh './gradlew clean'
                sh './gradlew build -x test'
            }
        }
        stage('RUN') {
        	steps {
        		sh 'docker build -t memo/app .'
        		sh 'docker stop memo-app'
        		sh 'docker run -d --rm -d --name memo-app --network memo-network memo/app'
        	}
        }
    }
}
