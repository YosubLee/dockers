# Haproxy

## SSL 변경

```bash

# SSL 발급완료
certbot certonly --manual --preferred-challenges dns -d "*.${도메인}.com"

# SSL 파일 병합
cat fullchain.pem privkey.pem > ssl.pem

# haproxy.cfg 파일에 추가
bind *:8080 ssl crt /usr/local/etc/haproxy/ssl.pem
```

Docker 실행
```bash
docker build -t haproxy:2.5.4 . 
docker run --name load-balancer --publish 443:8080 -detach --network memo-network,gitlab-network load-balancer
```

Docker Netork Setting
```bash
docker network create ci-network && \
docker network create gitlab-network 
```
