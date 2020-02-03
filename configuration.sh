#!/usr/bin/env bash

DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

# ----------------------------------------------
# you probably need to edit the following values
# ----------------------------------------------

# the URL that is opened in the browser to show the GUI on the screen
FRONTEND_URL="https://localhost"


# ----------------------------------------------
# backend config
# ----------------------------------------------

APP_BACKEND_URL="http://localhost:8080/api/invoice/subscribe"

# ----------------------------------------------
# bridge config
# ----------------------------------------------

APP_BACKEND_URL="http://localhost:8080/api/invoice/subscribe"

# only listen to paid invoices that have the following text at the beginning of their memo
MEMO_PREFIX="beerTap"


# ----------------------------------------------
# most likely you don't need to change anything here
# ----------------------------------------------
CHROME_ZOOM="1.0"
BRIDGE_JAVA_OPTS="-jar"
BRIDGE_JARFILE="beertap-bridge-runner.jar"
BRIDGE_JARPATH="beertap-bridge/target/"
GPIO_HANDLER_COMMAND="${DIR}/gpio_handler/gpio_handler.py"

