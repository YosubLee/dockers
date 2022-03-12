# Jenkins

```
# Jenkins Volume diretory

useradd -u 1000 jenkins \
-d /home/apps/jenkins \
-s /sbin/nologin

mkdir -p /home/apps/jenkins/memo-jenkins && \
chown -R jenkins.jenkins /home/apps/jenkins/memo-jenkins

docker build -t memo/jenkins:1.1 .
docker run --name memo-jenkins \
-d --network memo-network \
-v /home/apps/jenkins/memo-jenkins:/var/jenkins_home \
-v /var/run/docker.sock:/var/run/docker.sock \
memo/jenkins:1.1
```
