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
docker network create memo-network && \
docker network create gitlab-network

docker build -t load-balancer-haproxy . 
docker run --name load-balancer-haproxy --publish 443:8080 -detach --network memo-network,gitlab-network load-balancer-haproxy
```
