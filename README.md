#### Usage
```
git clone https://github.com/cventastic/POKT_DOKT.git
git submodule update --init --recursive
git pull --recurse-submodules
cd POKT_DOKT
chown -R 1005:1001 chains 
docker-compose up -d
```
# EXAMPLES
POKT QUERY:
```
curl -X POST --data '{"relay_network_id":"0002","payload":{"data":"{}","method":"POST","path":"v1/query/height","headers":{}}}' http://pocket-testnet:8081/v1/client/sim
```
GETH QUERY:
```
curl -X POST --data '{"relay_network_id":"0020","payload":{"data":"{\"jsonrpc\":\"2.0\",\"method\":\"eth_getBalance\",\"params\":[\"0x1a8c807a6E4F624fCab01FEBf76a541d31B8345A\", \"latest\"],\"id\":1}","metho
d":"POST","path":"","headers":{}}}' http://pocket-testnet:8081/v1/client/sim
```

#### TODO !!!! 
mal alle geth clients mit erigon vergleichen
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