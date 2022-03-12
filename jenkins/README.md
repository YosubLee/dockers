# Jenkins


## Docker Network Setting
```bash
docker network create ci-network
```


## Jenkins Setting
```bash
# Jenkins Volume diretory

useradd -u 1000 jenkins \
-d /home/apps/jenkins \
-s /sbin/nologin

mkdir -p /home/apps/jenkins/memo-jenkins && \
chown -R jenkins.jenkins /home/apps/jenkins/memo-jenkins

docker build -t memo/jenkins:2.332.1-lts-jdk11 .
docker run --name jenkins \
-d --network ci-network \
-v /home/apps/jenkins/memo-jenkins:/var/jenkins_home \
-v /var/run/docker.sock:/var/run/docker.sock \
memo/jenkins:2.332.1-lts-jdk11
```