#!/bin/bash

TELEGRAM_AUTH_TOKEN=5077327159:AAELNjCtFZTrLz7h5PW9Td1RTl8beNFgMbo
TELEGRAM_CHAT_ID=-697908946

curl_w() {
curl \
–retry-connrefused \
-sf "$@"
}

send_message() {
curl_w -X POST "https://api.telegram.org/bot${TELEGRAM_AUTH_TOKEN}/sendMessage" \
-H "Content-Type: application/json" \
-d "{\"chat_id\": \"${TELEGRAM_CHAT_ID}\", \"text\": \"${*}\", \"disable_notification\": false}"
}


chain_list="goerli ropsten rinkeby geth erigon harmony"

for i in $chain_list; do
        output=$(curl -s -X POST -H "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"eth_syncing","params":[],"id":1}' https://bsc-1.stakesquid-db.ml/$i)
        if [ $output != '{"jsonrpc":"2.0","id":1,"result":false}' ]; then
                send_message "$i not in sync"
        fi
done
