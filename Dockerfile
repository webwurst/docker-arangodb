from ubuntu:14.04

# arangodb
run apt-get update && apt-get install -y curl \
  && curl http://www.arangodb.org/repositories/arangodb2/xUbuntu_14.04/Release.key | apt-key add - \
  && echo "deb http://www.arangodb.org/repositories/arangodb2/xUbuntu_14.04/ /" > /etc/apt/sources.list.d/arangodb.list \
  && apt-get update && apt-get install -y arangodb

# config
add arangod.conf.env /etc/arangodb/
add arangod.conf /etc/arangodb/
add arangodb_run /usr/local/bin/

# volume ["/var/lib/arangodb/databases", "/var/lib/arangodb/apps"]
cmd ["arangodb_run"]
expose 8529
