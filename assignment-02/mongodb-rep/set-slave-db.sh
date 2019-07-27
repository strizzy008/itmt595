#!/bin/bash

#echo "192.168.50.14  mongodb-rep1-server" >> /etc/hosts
#echo "192.168.50.15  redis-caching-server" >> /etc/hosts

# Create mongodb config


cat <<EOT > /etc/mongod.conf
# mongod.conf

# for documentation of all options, see:
#   http://docs.mongodb.org/manual/reference/configuration-options/

# Where and how to store data.
storage:
  dbPath: /var/lib/mongodb
  journal:
    enabled: true
#  engine:
#  mmapv1:
#  wiredTiger:

# where to write logging data.
systemLog:
  destination: file
  logAppend: true
  path: /var/log/mongodb/mongod.log

# network interfaces
net:
  port: 27017
  bindIp: localhost


# how the process runs
processManagement:
  timeZoneInfo: /usr/share/zoneinfo

#security:

#operationProfiling:

#replication:

#sharding:

## Enterprise-Only Options:

#auditLog:

#snmp:

setParameter:
   enableLocalhostAuthBypass: false
EOT

cat <<EOT > ~/rsInit.js
rs.status()
EOT

cat <<EOT > ~/setSlave.js
db.getMongo().setSlaveOk()
EOT

mongod --fork --logpath /var/log/mongodb.log --config /etc/mongod.conf --replSet rs0 --enableMajorityReadConcern
mongo --host localhost ~/rsInit.js
mongo --host localhost < ~/setSlave.js

kill -9 $(pidof mongod)
echo "[MONGODB REP1] Set slave database..."
