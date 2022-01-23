Place validator.key and validator.pass into ./keyfiles
```
docker-compose up -d
```
Check if Bootstrap is working.
```
docker logs -f pokt_dokt_harmony-mainnet_1
```
Logs are at:
```
harmony/log
```

HARMONY QUERY
```
curl --location --request POST 'https://$DOMAIN/' --header 'Content-Type: application/json' --data-raw '{"jsonrpc": "2.0", "method": "hmy_latestHeader", "params": [], "id": 1}'
```