#!/usr/bin/env bash

set -e

ZCASH_HOME="/root/.zcash"
ZCASH_CONF="${ZCASH_HOME}/zcash.conf"

mkdir -p ${ZCASH_HOME}

echo "generate ${ZCASH_CONF}"
echo "addnode=mainnet.z.cash" > ${ZCASH_CONF}
echo "rpcuser=username" >> ${ZCASH_CONF}
echo "rpcpassword=$(head -c 32 /dev/urandom | base64)" >> ${ZCASH_CONF}

/usr/local/bin/zcashd
exit $?
