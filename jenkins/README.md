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

mkdir -p /home/apps/jenkins/jenkins && \
chown -R jenkins.jenkins /home/apps/jenkins/jenkins

docker build -t jenkins:2.332.1-lts-jdk11 .
docker run --name jenkins \
-d --network ci-network \
-v /home/apps/jenkins:/var/jenkins_home \
-v /var/run/docker.sock:/var/run/docker.sock \
jenkins:2.332.1-lts-jdk11
```