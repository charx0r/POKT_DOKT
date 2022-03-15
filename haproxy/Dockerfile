FROM haproxy:alpine

USER root
RUN apk add --no-cache curl bash jq
USER haproxy

CMD ["haproxy", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]