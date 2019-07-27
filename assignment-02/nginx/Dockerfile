FROM ubuntu
LABEL maintainer="bstrawte@hawk.iit.edu"
ENV REFRESHED_AT 2019-07-17
USER root
RUN apt-get -y update
RUN apt install net-tools
RUN apt-get purge nginx-common -y
RUN apt-get install nginx openssl systemd easy-rsa -y
ADD ./start-nginx-server.sh /tmp/start-nginx-server.sh
RUN chmod +x /tmp/start-nginx-server.sh
RUN sh /tmp/start-nginx-server.sh
RUN ln -s /etc/nginx/sites-available/reverse-proxy.conf /etc/nginx/sites-enabled/reverse-proxy.conf
EXPOSE 80
RUN nginx
