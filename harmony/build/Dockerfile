FROM alpine

RUN apk add --no-cache bash libstdc++ gmp-dev libc6-compat bind-tools jq curl && ln -s libcrypto.so.1.1 /lib/libcrypto.so.10

EXPOSE 9000/tcp 9500/tcp 9800/tcp 6000/tcp

VOLUME ["/harmony/harmony_db_0","/harmony/harmony_db_1","/harmony/harmony_db_2","/harmony/harmony_db_3","/harmony/log","/harmony/.hmy"]

RUN curl -LO https://harmony.one/binary && chmod +x binary

CMD /binary --log.dir /harmony/log --run explorer --bootnodes /ip4/100.26.90.187/tcp/9874/p2p/Qmdfjtk6hPoyrH1zVD9PEH4zfWLo38dP2mDvvKXfh3tnEv,/ip4/54.213.43.194/tcp/9874/p2p/QmZJJx6AdaoEkGLrYG4JeLCKeCKDjnFz2wfHNHxAqFSGA9,/ip4/13.113.101.219/tcp/12019/p2p/QmQayinFSgMMw5cSpDUiD9pQ2WeP6WNmGxpZ6ou3mdVFJX,/ip4/99.81.170.167/tcp/12019/p2p/QmRVbTpEYup8dSaURZfF6ByrMTSKa4UyUzJhSjahFzRqNj --dns.zone t.hmny.io --http.ip 0.0.0.0
