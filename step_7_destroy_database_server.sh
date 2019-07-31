#!/usr/bin/env bash

figlet -f standard -w 180 "Destroy AWS RDS Oracle Database"


cd ./terraform-oracle/

terraform destroy -auto-approve

cd ..

rm ./.IP_ADDRESS
rm ./.DNS_NAME
rm -rf ./sqlplus-out