#!/usr/bin/env bash
# arg1 CN Common Name
# arg2 O Organization
# arg3 ST State or province
# arg4 C Country (2 characters)

openssl genrsa -out intermediate/private/$1.key.pem 2048
chmod 400 intermediate/private/$1.key.pem

openssl req -nodes -config intermediate/openssl.cnf -subj "/CN=$1/O=$2/ST=$3/C=$4" \
      -key intermediate/private/$1.key.pem \
      -new -sha256 -out intermediate/csr/$1.csr.pem

openssl ca -config intermediate/openssl.cnf -batch \
      -extensions server_cert -days 375 -notext -md sha256 \
      -in intermediate/csr/$1.csr.pem \
      -out intermediate/certs/$1.cert.pem

chmod 444 intermediate/certs/$1.cert.pem

cat intermediate/certs/$1.cert.pem intermediate/certs/ca-chain.cert.pem > intermediate/certs/$1.crt
chmod 444 intermediate/certs/$1.crt