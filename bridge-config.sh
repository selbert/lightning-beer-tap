#!/usr/bin/env bash

DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

# ----------------------------------------------
# bridge config
# ----------------------------------------------

export APP_BACKEND_URL="http://localhost:8080/api/invoice/subscribe"

export APP_EXEC_PATH="${DIR}/gpio_handler/gpio_handler.py"
export APP_MEMO_PREFIX="beerTap"
