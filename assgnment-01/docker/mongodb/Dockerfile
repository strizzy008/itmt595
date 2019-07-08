FROM ubuntu
LABEL maintainer="bstrawte@hawk.iit.edu"
ENV REFRESHED_AT 2019-07-07
USER root
RUN apt-get -y update
RUN apt install net-tools gnupg gnupg-l10n gnupg-utils ca-certificates -y
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
RUN touch /etc/apt/sources.list.d/mongodb-org-4.0.list
RUN echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" > /etc/apt/sources.list.d/mongodb-org-4.0.list
RUN cat /etc/apt/sources.list.d/mongodb-org-4.0.list
RUN apt-get -y update
RUN apt-get install -y mongodb-org
ADD ./set-master-db.sh .
RUN chmod +x ./set-master-db.sh
EXPOSE 27017
RUN ./set-master-db.sh

