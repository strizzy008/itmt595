#!/bin/bash


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

#cat <<EOT > ~/rsInit.js
#rs.initiate()
#rs.status()
#cfg = rs.conf()
#cfg.members[0].priority = 1
#cfg.members[1].priority = 0
#rs.reconfig(cfg, {force: true})
#EOT

#cat <<EOT > ~/addUsers.js
#rs.add( { host: "mongodb-rep:27017", priority: 0, votes: 0 } )
#db = db.getSiblingDB("admin");
#db.createUser({
#  user: "production-root",
#  pwd: "production-root",
#  roles: ["root"]
#});

#db = db.getSiblingDB("production-db");
#db.createUser({
#  user: "production-user",
#  pwd: "production-password",
#  roles: ["readWrite"]
#});
#db.createCollection("sample");
#db.sample.insert({ word: "hi" });
#EOT

mongod --fork --logpath /var/log/mongodb.log --config /etc/mongod.conf --replSet rs0

#mongo --host localhost ~/rsInit.js
#mongo --host localhost ~/addUsers.js

kill -9 $(pidof mongod)
echo "[MOGODB] Set master database..."

mongod --fork --logpath /var/log/mongodb.log --config /etc/mongod.conf --replSet rs0
