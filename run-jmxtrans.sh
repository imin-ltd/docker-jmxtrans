#!/bin/bash

JMXTRANS_HEAP_SIZE=${JMXTRANS_HEAP_SIZE:-"512"}
JMXTRANS_LOG_LEVEL=${JMXTRANS_LOG_LEVEL:-"INFO"}
JMXTRANS_PERIOD=${JMXTRANS_PERIOD:-"10"}

JMXTRANS_JAR="/usr/share/jmxtrans/lib/jmxtrans-all.jar"
JMXTRANS_CONFIG="/jmxtrans-config.json"

JAVA_OPTS="-Xms${JMXTRANS_HEAP_SIZE}m -Xmx${JMXTRANS_HEAP_SIZE}m -Djava.awt.headless=true -Djava.net.preferIPv4Stack=true"
JMXTRANS_OPTS="-Djmxtrans.log.level=${JMXTRANS_LOG_LEVEL} -Dlog4j.configuration=file:///log4j.xml -Djmx.alias=${JMX_ALIAS} -Djmx.host=${JMX_HOST} -Djmx.port=${JMX_PORT}"
EXEC="-jar $JMXTRANS_JAR -e -f $JMXTRANS_CONFIG -s $JMXTRANS_PERIOD -c false"

exec java -server $JAVA_OPTS $JMXTRANS_OPTS $EXEC
