#!/usr/bin/env bash

figlet -f standard -w 180 "Create AWS RDS Oracle Database"

cd ./terraform-oracle/

terraform init
terraform apply -auto-approve

cd ..

aws ec2 describe-network-interfaces | jq -r '.NetworkInterfaces[].Association.PublicDnsName' > ./.DNS_NAME
aws ec2 describe-network-interfaces | jq -r '.NetworkInterfaces[].Association.PublicIp' > ./.IP_ADDRESS

echo 'IP_ADDRESS='$echo`cat ./.IP_ADDRESS`
echo 'DNS_NAME='$echo`cat ./.DNS_NAME`