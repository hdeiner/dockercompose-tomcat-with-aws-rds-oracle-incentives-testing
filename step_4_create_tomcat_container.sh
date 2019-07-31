#!/usr/bin/env bash

figlet -f standard -w 180 "Create Tomcat Container"

docker-compose -f docker-compose-incentives-integration-testing.yml up -d
date

rm -rf logs_tomcat
mkdir logs_tomcat

echo "Waiting for Tomcat to start"
while true ; do
  curl -s localhost:8080 > tmp.txt
  result=$(grep -c "Apache Tomcat/7.0.54" tmp.txt)
  if [ $result = 2 ] ; then
    echo "Tomcat has started"
    break
  fi
  sleep 5
done
rm tmp.txt
date