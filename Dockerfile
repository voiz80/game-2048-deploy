FROM ubuntu:22.04

LABEL MAINTAINER='Ivo Dimitrov <voiz80@gmail.com>'

RUN apt-get update
RUN apt-get install -y nginx zip curl

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN curl -o /var/www/html/game-2048-deploy-master.zip -L https://github.com/voiz80/game-2048-deploy/archive/refs/heads/master.zip
RUN cd /var/www/html/ && unzip game-2048-deploy-master.zip && mv game-2048-deploy-master/* . && rm -rf game-2048-deploy-master.zip game-2048-deploy-master

EXPOSE 80
# load nginx forground
CMD ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"] 