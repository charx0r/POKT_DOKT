#!/bin/bash

mkdir -p /harmony/harmony_db_0 /harmony/harmony_db_1 /harmony/harmony_db_2 /harmony/harmony_db_3 /harmony/log /harmony/.hmy

cat<<-EOF > rclone.conf
[release]
type = s3
provider = AWS
env_auth = false
region = us-west-1
acl = public-read
server_side_encryption = AES256
storage_class = REDUCED_REDUNDANCY
EOF

if [ ! -f /harmony/setupdone ]
then
  # https://docs.harmony.one/home/network/validators/node-setup/syncing-db#2.-configuring-rclone
  rclone --config=rclone.conf -P -L sync release:pub.harmony.one/mainnet.min/harmony_db_0 /harmony/harmony_db_0 --multi-thread-streams 4 --transfers=8
  rclone --config=rclone.conf -P -L sync release:pub.harmony.one/mainnet.min/harmony_db_1 /harmony/harmony_db_1 --multi-thread-streams 4 --transfers=8
  touch /harmony/setupdone
fi
