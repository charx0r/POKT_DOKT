#!/bin/sh
if [ ! -f /home/app/.pocket/setupdone ]
then
  mkdir -p /home/app/.pocket/data
  #chown -R 1005:1001 /home/app/
  wget -q -O - https://link.us1.storjshare.io/raw/jwb73f5wya2no5fcogrlpmmps7fq/pocket-public-blockchains/pocket-network-data-1214-rc-0.6.3.6.tar | tar -xv -C /home/app/.pocket/data/  touch /home/app/.pocket/setupdone
fi