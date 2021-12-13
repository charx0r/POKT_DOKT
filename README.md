#### Usage
```
git clone https://github.com/cventastic/POKT_DOKT.git
git submodule update --init --recursive
git pull --recurse-submodules
cd POKT_DOKT
chown -R 1005:1001 chains 
docker-compose up -d
```

#### TODO !!!! 

poly_submodule? -> relativer pfad vom submodule, macht probleme wenn man docker-compose vom root des repos aufruft.

POKT: 
- Beim lesen von chain.json braucht pokt rechte auf den chains ordner: chown -R 1005:1001 chains
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