#### Usage
```
git clone https://github.com/cventastic/POKT_DOKT.git
cd POKT_DOKT
chown -R 1005:1001 chains 
docker-compose up -d
```

#### TODO !!!! 

POKT: 
- Beim lesen von chain.json braucht pokt rechte auf den chains ordner: chown -R 1005:1001 chains
- command: pocket start --seeds=$POCKET_TEST_SEEDS --testnet ! testnet variable?!
- Archive?
- Monitoring

GOERLI:
- Bootstrap Archive
- Monitoring

RINKEBY:
- Bootstrap Archive
- Monitoring

ROPSTEN:
- Bootstrap Archive
- Monitoring

MAINNET:
- Bootstrap Archive
- Monitoring

ERIGON-Trace:
- Bootstrap Archive
- Monitoring

AVALANCHE:
- Archive?
- Monitoring https://docs.avax.network/build/tools/dashboards/README