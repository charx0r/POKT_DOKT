FROM alpine

RUN apk add --no-cache bash libstdc++ gmp-dev libc6-compat bind-tools jq curl rclone bash && ln -s libcrypto.so.1.1 /lib/libcrypto.so.10

EXPOSE 9000/tcp 9500/tcp 9800/tcp 6000/tcp

RUN mkdir /harmony/harmony_db_0 /harmony/harmony_db_1 /harmony/harmony_db_2 /harmony/harmony_db_3 /harmony/log /harmony/.hmy

RUN curl -LO https://harmony.one/binary && chmod +x binary

CMD /binary --log.dir /harmony/log --run explorer --run.shard 0 --dns.zone t.hmny.io --http.ip 0.0.0.0 --datadir /harmony