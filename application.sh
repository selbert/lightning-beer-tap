#!/usr/bin/env bash

DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
source ${DIR}/configuration.sh

usage(){
cat << EOF                                                                              
Usage: $0 [OPTIONS]                                          

This script handles all interactions with the lightning powered beertap.

OPTIONS:
	start	Initializes the device, starts the dashboard and web bridge
	stop	Stops all services
	build	Build or rebuild the java web bridge to the lightning node
                                                                                           
EXAMPLES:                                                                               
    application restart

EOF
}

# Start all services on the beer tap device
app_start(){
  source ${DIR}/backend-config.sh

	BRIDGE_JAR=${DIR}/${BRIDGE_JARPATH}${BRIDGE_JARFILE}
	BACKEND_JAR=${DIR}/${BACKEND_JARPATH}${BACKEND_JARFILE}
	echo "${BRIDGE_JAR}"
	echo "${BACKEND_JAR}"
	# Check if the websocket bridge has been built
	if [ ! -f ${BRIDGE_JAR} ] || [ ! -f ${BACKEND_JAR} ] ; then
		app_build
	fi
	# Start up the dashboard
	# source ${DIR}/dashboard/dashboard.sh
	# Hide mouse when still
	#DISPLAY=:0 unclutter -idle 0.01 -root &
	# Start websocket bridge, fork to background and no output
  echo "${OPENNODE_API_URI}"
	java ${BACKEND_JAVA_OPTS} ${BACKEND_JAR}

  APP_EXEC_PATH="${GPIO_HANDLER_COMMAND}"
  APP_MEMO_PREFIX="${MEMO_PREFIX}"
	nohup java ${BRIDGE_JAVA_OPTS} ${BRIDGE_JAR} & >/dev/null 2>&1
}

# Stop all services
app_stop(){
	echo "Killing all services..."
	killall java
	pkill -o chromium
	killall unclutter
}

# Build or rebuild the java lighning node web bridge
app_build(){
	echo "Building the bridge bridge please wait"
	cd ${DIR}/beertap-bridge && ./mvnw clean package
	echo "Building the backend bridge please wait"
	cd ${DIR}/beertap-backend && ./mvnw clean package
}

# Argument parsing
case $1 in
	start)
	app_start
	exit 0;
	;;

	stop)
	app_stop
	exit 0;
	;;

	build)
	app_build
	exit 0;
	;;

	restart)
	app_stop
    app_start
	exit 0;
	;;

	*)
	usage
	exit 0;
	;;
esac
