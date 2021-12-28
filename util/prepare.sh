#!/bin/sh

source ../.env
envsubst < ../chains/chains_mainnet.json > ../chains/chains_mainnet.json
envsubst < ../chains/chains_testnet.json > ../chains/chains_testnet.json
chown -R 1005:1001 ../chains ../bootstrap_skript
