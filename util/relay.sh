#!/bin/bash

# Only geth right now
declare -A chain_arr
chain_arr[goerli]="0026"
chain_arr[rinkeby]="0025"
chain_arr[ropsten]="0023"
chain_arr[mainnet]="0021"
chain_arr[harmony]="040"
chain_arr[xdai]="0027"
# ARCHIVAL TRACE
chain_arr[erigon]="0028"
chain_arr[erigon]="0021"
# ARCHIVE
chain_arr[erigon]="0022"

for i in ${!chain_arr[@]}; do
  echo curl ${i} ${chain_arr[${i}]}
  curl -s -X POST --data '{"relay_network_id":"'${chain_arr[${i}]}'","payload":{"data":"{\"jsonrpc\":\"2.0\",\"method\":\"eth_syncing\",\"params\":[],\"id\":1}","method":"POST","path":"","headers":{}}}' http://127.0.0.1:8081/v1/client/sim | awk "{print $2}"
done

POKT="0001"
curl -X POST --data '{"relay_network_id":"'$POKT'","payload":{"data":"{}","method":"POST","path":"v1/query/height","headers":{}}}' http://localhost:8081/v1/client/sim
echo \n
