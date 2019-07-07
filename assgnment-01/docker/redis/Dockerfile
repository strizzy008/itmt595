FROM ubuntu
LABEL maintainer="bstrawte@hawk.iit.edu"
ENV REFRESHED_AT 2019-07-07
USER root
RUN apt-get -y update
RUN apt install redis-server -y
RUN sed -i '147s/no/systemd/' /etc/redis/redis.conf
RUN sed -i '69s/127.0.0.1 ::1/192.168.50.15/' /etc/redis/redis.conf
RUN sed -i '500s/# requirepass foobared/requirepass A81jWlISU\/yYAtNlb+b5jdHpQ\/N9epFNWYrhJciQ2NF50mHT1t7UPeT+TkEQLpYkasIrmoR4ck6V85cy/' /etc/redis/redis.conf
