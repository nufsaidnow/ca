#!/usr/bin/env bash

rm -rf intermediate
rm newcerts/*
rm index.txt*
rm serial*
rm crlnumber*

echo 1000 > serial
echo 1000 > crlnumber
touch index.txt