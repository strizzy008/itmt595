FROM ubuntu
LABEL maintainer="bstrawte@hawk.iit.edu"
ENV REFRESHED_AT 2019-07-07
USER root
RUN apt-get -y update
RUN apt install net-tools build-essential git curl wget systemd -y
WORKDIR /home/root
RUN curl -sL https://deb.nodesource.com/setup_11.x -o nodesource_setup.sh
RUN chmod +x nodesource_setup.sh
RUN ./nodesource_setup.sh
RUN apt-get install nodejs -y
ADD ./set-up-node2.sh .
RUN chmod +x ./set-up-node2.sh
RUN ./set-up-node2.sh
