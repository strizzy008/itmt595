FROM ubuntu
LABEL maintainer="bstrawte@hawk.iit.edu"
ENV REFRESHED_AT 2019-07-06
USER root
RUN apt-get -y update
RUN apt install net-tools
RUN apt-get purge nginx-common -y
RUN apt-get install nginx -y
RUN ln -s /etc/nginx/sites-available/reverse-proxy.conf /etc/nginx/sites-enabled/reverse-proxy.conf
ADD ./hostsConfig.sh /tmp/hostsConfig.sh
RUN chmod +x /tmp/hostsConfig.sh
RUN sh /tmp/hostsConfig.sh
