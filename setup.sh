#!/bin/bash

# Create Cassandra keyspaces.
echo "Creating Cassandra keyspaces..."
DELAY=1
while ! /cassandra/bin/cqlsh `hostname -i` -f "/spinnaker/cassandra/create_echo_keyspace.cql" && [ "$DELAY" -lt 32 ]
do
    sleep $DELAY
    let DELAY*=2
done

/cassandra/bin/cqlsh `hostname -i` -f "/spinnaker/cassandra/create_front50_keyspace.cql"

echo "Cassandra is ready."
