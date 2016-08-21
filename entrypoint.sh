#!/usr/bin/env bash

set -e

ZCASH_HOME="/root/.zcash"
ZCASH_CONF="${ZCASH_HOME}/zcash.conf"

if [ ! -f "${ZCASH_CONF}" ]; then
    echo "generate ${ZCASH_CONF}"
    password=$(head /dev/urandom | sha256sum | cut -c1-60)
    printf '%s\n%s\n%s\n%s\n%s\n' "rpcuser=zcashrpc" "rpcpassword=${password}" \
           "testnet=1" "addnode=alphatestnet.z.cash" "gen=1" > ${ZCASH_CONF}
fi

# why not use exec here?
/usr/local/bin/zcashd
exit $?
