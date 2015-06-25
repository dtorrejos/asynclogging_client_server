#!/bin/bash

CASSANDRA_PATH=/opt/apache-cassandra-2.1.7

kill -9 $(cat $CASSANDRA_PATH/cassandra.pid)

