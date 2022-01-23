#!/bin/bash
if [ ! -f /setupdone ]
then
  # https://docs.harmony.one/home/network/validators/node-setup/syncing-db#2.-configuring-rclone
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

  rclone --config=rclone.conf -P -L sync release:pub.harmony.one/mainnet.min/harmony_db_0 /harmony/harmony_db_0 --multi-thread-streams 4 --transfers=8
  rclone --config+rclone.conf -P -L sync release:pub.harmony.one/mainnet.min/harmony_db_1 /harmony/harmony_db_1 --multi-thread-streams 4 --transfers=8
  touch /setupdone
fi
