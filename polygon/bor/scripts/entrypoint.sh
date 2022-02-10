#!/bin/sh

# exit script on any error
set -e

# Set Bor Home Directory
BOR_HOME=/datadir

# Check for genesis file and download or update it if needed
if [ ! -f "${BOR_HOME}/genesis.json" ];
then
    echo "setting up initial configurations"
    cd ${BOR_HOME}
    echo "downloading launch genesis file"
    wget https://raw.githubusercontent.com/maticnetwork/launch/ea7ef12751291f7331b383506e5a714703f37362/mainnet-v1/sentry/sentry/bor/genesis.json
    echo "initializing bor with genesis file"
    bor --datadir ${BOR_HOME} init ${BOR_HOME}/genesis.json
else
    # Check if genesis file needs updating
    cd ${BOR_HOME}
    GREPSTRING=$(grep 22156660 genesis.json | wc -l) # v0-2-12-beta3 Update
    if [ ${GREPSTRING} == 0 ];
    then
        echo "Updating Genesis File"
        wget https://raw.githubusercontent.com/maticnetwork/launch/ea7ef12751291f7331b383506e5a714703f37362/mainnet-v1/sentry/sentry/bor/genesis.json
        bor --datadir ${BOR_HOME} init ${BOR_HOME}/genesis.json
    fi
fi

if [ "${BOOTSTRAP}" == 1 ] && [ -n "${SNAPSHOT_URL}" ] && [ ! -f "${BOR_HOME}/bootstrapped" ];
then
  echo "downloading snapshot from ${SNAPSHOT_URL}"
  mkdir -p ${BOR_HOME}/bor/chaindata
  wget -c "${SNAPSHOT_URL}" -O - | tar -xz -C ${BOR_HOME}/bor/chaindata && touch ${BOR_HOME}/bootstrapped
fi


READY=$(curl -s heimdalld:26657/status | jq '.result.sync_info.catching_up')
while [[ "${READY}" != "false" ]];
do
    echo "Waiting for heimdalld to catch up."
    sleep 30
    READY=$(curl -s heimdalld:26657/status | jq '.result.sync_info.catching_up')
done

exec bor --port=30303 --maxpeers=200 --datadir=/datadir  --networkid=137 --syncmode=full --gcmode=archive --miner.gaslimit=200000000  --miner.gastarget=20000000 --bor.heimdall=http://heimdallr:1317 --http --http.addr=0.0.0.0 --http.port=8545 --http.api=eth,net,web3,bor --http.corsdomain="*" --http.vhosts="*" --ws --ws.addr=0.0.0.0 --ws.port=8546 --ws.api=eth,net,web3,bor --ws.origins="*" --nousb --bootnodes=enode://0cb82b395094ee4a2915e9714894627de9ed8498fb881cec6db7c65e8b9a5bd7f2f25cc84e71e89d0947e51c76e85d0847de848c7782b13c0255247a6758178c@44.232.55.71:30303,enode://88116f4295f5a31538ae409e4d44ad40d22e44ee9342869e7d68bdec55b0f83c1530355ce8b41fbec0928a7d75a5745d528450d30aec92066ab6ba1ee351d710@159.203.9.164:30303