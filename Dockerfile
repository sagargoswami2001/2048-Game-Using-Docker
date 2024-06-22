FROM ubuntu:22.04
RUN apt-get update
RUN apt-get install -y nginx zip curl
RUN echo "daemon off;" >>/etc/nginx/nginx.conf
RUN curl -o /tmp/main.zip -L https://github.com/sagargoswami2001/2048-Game-Using-Docker/archive/refs/heads/main.zip && \
    mkdir -p /var/www/html && \
    unzip /tmp/main.zip -d /var/www/html && \
    mv /var/www/html/2048-Game-Using-Docker-main/* /var/www/html/ && \
    rm -rf /var/www/html/2048-Game-Using-Docker-main /tmp/main.zip

EXPOSE 80
CMD ["/usr/sbin/nginx","-c","/etc/nginx/nginx.conf"]
