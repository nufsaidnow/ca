#!/usr/bin/env bash

openssl ca -config intermediate/openssl.cnf -batch \
      -extensions server_cert -days 375 -notext -md sha256 \
      -in $2 \
      -out intermediate/certs/$1.cert.pem

chmod 444 intermediate/certs/$1.cert.pem

cat intermediate/certs/$1.cert.pem intermediate/certs/ca-chain.cert.pem > intermediate/certs/$1.crt
chmod 444 intermediate/certs/$1.crt