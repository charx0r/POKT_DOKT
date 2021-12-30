Tested on Ubuntu 20.04.3 LTS

#### Prerequisites:
docker <br />
docker-compose <br />
DNS A-Record pointing to your server <br />
Wireguard-Server: Paste wireguard wg0.conf from wireguard-server to wireguard/config/wg0.conf <br />

#### Usage

```
git clone https://github.com/cventastic/POKT_DOKT.git
cd POKT_DOKT
git reset --hard origin/main && git pull && ./util/prepare.sh
```

This compose file needs the following env-vars for example in a .env file inside the repo root-folder:
```
# Private Key for Pocket-Account mainnet can be generated here (https://wallet.pokt.network/)
POCKET_CORE_KEY=
POCKET_CORE_PASSPHRASE=
# Private Key for Pocket-Account testnet can be generated here (https://wallet.testnet.pokt.network/)
POCKET_CORE_KEY_TEST=
POCKET_CORE_PASSPHRASE_TEST=
# POCKET SEEDS (https://docs.pokt.network/home/resources/references/seeds)
POCKET_MAIN_SEEDS=
POCKET_TEST_SEEDS=
# SNAPSHOT (https://github.com/pokt-network/pocket-snapshots)
POCKET_SNAPSHOT=""
# LETSENCRYPT
DOMAIN=
MAIL=
SERVERPORT=
PUID=
PGID=
# IP WHITELIST FOR TRAFFIC
WHITELIST=
# ENV VARS fuer prepare Skript
export DOMAIN
```

!!! I added a simple test-script (util/test_relay.sh) to see if the (geth)chains are synced. Dont try to relay before they are. <br />
To test if relaying chains works, pokt-testnet-service and pokt-mainnet service have to be provided with the following command parameters:
```
command: pocket start --simulateRelay
``` 
If you want to activly relay. You also have to Stake! <br />
Testnet-Faucet: (https://faucet.pokt.network/) <br />
How to stake: https://docs.pokt.network/home/paths/node-runner#stake-the-validator <br />

# EXAMPLES

POKT QUERY:
```
Pockt-Testnet:
curl -X POST --data '{"relay_network_id":"0002","payload":{"data":"{}","method":"POST","path":"v1/query/height","headers":{}}}' http://localhost:8082/v1/client/sim
Pocket-Mainnet:
curl -X POST --data '{"relay_network_id":"0002","payload":{"data":"{}","method":"POST","path":"v1/query/height","headers":{}}}' http://localhost:8081/v1/client/sim
```
GETH QUERY (von gewhitelisteten servern e.g pokt-test):
```
Pocket-Testnet:
curl -X POST --data '{"relay_network_id":"0020","payload":{"data":"{\"jsonrpc\":\"2.0\",\"method\":\"eth_getBalance\",\"params\":[\"0x1a8c807a6E4F624fCab01FEBf76a541d31B8345A\", \"latest\"],\"id\":1}","method":"POST","path":"","headers":{}}}' http://127.0.0.1:8082/v1/client/sim
curl -v -X POST --data '{"relay_network_id":"0020","payload":{"data":"{\"jsonrpc\":\"2.0\",\"method\":\"eth_syncing\",\"params\":[],\"id\":1}","method":"POST","path":"","headers":{}}}' http://127.0.0.1:8082/v1/client/sim
Pocket-Mainnet:
curl -X POST --data '{"relay_network_id":"0020","payload":{"data":"{\"jsonrpc\":\"2.0\",\"method\":\"eth_getBalance\",\"params\":[\"0x1a8c807a6E4F624fCab01FEBf76a541d31B8345A\", \"latest\"],\"id\":1}","method":"POST","path":"","headers":{}}}' http://127.0.0.1:8081/v1/client/sim
curl -v -X POST --data '{"relay_network_id":"0020","payload":{"data":"{\"jsonrpc\":\"2.0\",\"method\":\"eth_syncing\",\"params\":[],\"id\":1}","method":"POST","path":"","headers":{}}}' http://127.0.0.1:8081/v1/client/sim
```

# SSL
I you want to test SSL comment in:
```
# - "--certificatesresolvers.myresolver.acme.caserver=https://acme-staging-v02.api.letsencrypt.org/directory" 
```
Check if there is a file here /traefic/letsencrypt/acme.json if yes, you have to delete it. <br /> 
Otherwise traefik will not issue the certificate for an existing domain. <br />

#### TODO !!!! 
mal alle geth clients mit erigon vergleichen <br />
LOGFILES <br />
General Monitoring <br />
Bootstrapping from Snapshots <br />
Link-Timezone into containers.


AVALANCHE:
- Archive?
- Monitoring https://docs.avax.network/build/tools/dashboards/README