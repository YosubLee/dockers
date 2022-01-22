FROM haproxy:2.5.1


# haproxy img
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg

# ssl file
COPY ssl.pem /usr/local/etc/haproxy/ssl.pem

EXPOSE 8080