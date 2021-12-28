#!/bin/bash

source .env

originalfile="chains/chains_mainnet.json"
tmpfile=$(mktemp)
cp --attributes-only --preserve $originalfile $tmpfile
cat $originalfile | envsubst > $tmpfile && mv $tmpfile $originalfile

originalfile="chains/chains_testnet.json"
tmpfile=$(mktemp)
cp --attributes-only --preserve $originalfile $tmpfile
cat $originalfile | envsubst > $tmpfile && mv $tmpfile $originalfile

chown -R 1005:1001 chains bootstrap_skript