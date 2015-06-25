README:

Asynclogger client

install redis
-wget http://download.redis.io/redis-stable.tar.gz
-tar xvzf redis-stable.tar.gz
-cd redis-stable
-make
-make install
- run redis-server

  gem build clientlogs.gemspec
  gem install clientlogs-1.0.0.gem

----------------
in test ruby client

require 'Clientlogger'

logger = Clientlogger.new("INFO","/tmp/test.log","somekey")
logger.info("Info log message",":tag")

--------------

install redis for ruby
gem install redis
 

-----------

Server(currently server is on localhost only(127.0.0.1)

install the following

1.NODE

$ wget http://nodejs.org/dist/v0.12.0/node-v0.12.0-linux-x64.tar.gz
$ tar xvfz node-v0.12.0-linux-x64.tar.gz
$ mkdir -p /usr/local/nodejs
$ mv node-v0.12.0-linux-x64/* /usr/local/nodejs


2. redis using npm

  - npm install redis

3. cassandra using npm
  - npm install cassandra-driver

4. cassandra server

$cd /opt/
$wget http://mirror.reverse.net/pub/apache/cassandra/2.1.7/apache-cassandra-2.1.7-bin.tar.gz


$tar zxvf apache-cassandra-2.1.2-bin.tar.gz

data_file_directories “/var/lib/cassandra/data”

commitlog_directory “/var/lib/cassandra/commitlog”

saved_caches_directory “/var/lib/cassandra/saved_caches”

Make sure these directories exist and can be written to, as shown below.

$mkdir /var/lib/cassandra
$mkdir /var/log/cassandra

$ chmod 777 /var/lib/cassandra
$ chmod 777 /var/log/cassandra

create the following scripts:

a.start_cassandra.sh

#!/bin/bash

# Here, we are defining variable CASSANDRA_PATH to store value of absolute path for Cassandra
CASSANDRA_PATH=/opt/apache-cassandra-2.1.7
 
# now run below given command, it help to run the Cassandra in background. For foreground process use -f option. The -p option is for creating pid file
$CASSANDRA_PATH/bin/cassandra -p $CASSANDRA_PATH/cassandra.pid

----------------

b.stop_cassandra.sh
#!/bin/bash

CASSANDRA_PATH=/opt/apache-cassandra-2.1.7
kill -9  $(cat $CASSANDRA_PATH/cassandra.pid)

----------------

c.start_cql.sh
#!/bin/bash

CASSANDRA_PATH=/opt/apache-cassandra-2.1.7
$CASSANDRA_PATH/bin/cqlsh

----------------


start the server
./start_cassandra.sh
ver

CREATE tables

in CQLSH
 - CREATE KEYSPACE demo
WITH replication = {'class':'SimpleStrategy', 'replication_factor' : 3};
 - use demo;
 - CREATE table demo(lognum int PRIMARY KEY, dated timestamp, tags text, level text, message text);

------------------

5. run runForever.sh 

6. for test specs, run loggerspec.rb (spec loggerspec.rb) check log files and db for verification
