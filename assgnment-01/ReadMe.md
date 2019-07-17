# Assignment-01 Deliverable

## Part-01

### Vagrant Box List

COMPLETE

Put screenshot here

### Index Page Screenshot

Query in Discussion Board

Put Screenshot here

## Part-02

I have 4 built images for the APP. These images utilize the additional scripts within each folder per service. I am able to build the APP however there a couple of failures I have seen and not able to resolve. 

####First you must build theimages with the dockerfile in each servcies folder. call the images:

Node Application - nodeapp
Nginx Web Proxy - nginx
Mongo DB - mongodb01
Redis Cache - rediscache

e.x : sudo docker build -t="nginx" .     (this assumes you are in the nginx directory) 

###Configuration findings:

NGINX - the nginx web configuration , when starting nginx, throws a message about the node system that it is proxying for. I am not sure why this is happening as container being build from the node-app image is called node. but the nginx output says it cannot recognize the name.

........
#nginx: [emerg] host not found in upstream "node" in /etc/nginx/sites-enabled/reverse-proxy.conf:9
The command '/bin/sh -c nginx' returned a non-zero code: 1

#Node - The node system and app builds however the process does not stay alive for when the container is not in interactive mode. I even ran docker-compose up '-d' to get the whole app daemonized but still just starting and halting. 

#mongodb - for this service I have eliminated the java script for the primary/secondary configurations and will be running no auth for functionality sakes

#redis- is just a stand alone service that has no config relations to the rest of app

Include your command to run your Docker Compose YAML file here along with all needed virtual mounts or other assumptions.  You can choose to build from base containers or use a company's pre-installed container.  To test the code -- I will pull your repo and run the code based on the instructions you list here.
