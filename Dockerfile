FROM haproxy:2.5.1
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
EXPOST 8080