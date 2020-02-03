#!/usr/bin/env bash

# ----------------------------------------------
# backend config
# ----------------------------------------------
export LIGHTNING_CLIENT_PREFERRED=

export APP_ALLOWORIGIN=

# ----------------------------------------------
# backend LND config
# ----------------------------------------------
export LND_URL=
export LND_CONFIG_MACAROON_READONLY=
export LND_CONFIG_MACAROON_INVOICE=
export LND_CONFIG_CERT_PATH=

# ----------------------------------------------
# backend OpenNode config
# ----------------------------------------------
export OPENNODE_API_URI=
export OPENNODE_API_TOKEN=

# ----------------------------------------------
# backend BtcPayServer config
# ----------------------------------------------
export BTCPAY_API_URI=
export BTCPAY_API_TOKEN=


# ----------------------------------------------
# backend startup config
# ----------------------------------------------
BACKEND_JAVA_OPTS="-jar"
BACKEND_JARFILE="mini-zeus-runner.jar"
BACKEND_JARPATH="beertap-backend/target/"

