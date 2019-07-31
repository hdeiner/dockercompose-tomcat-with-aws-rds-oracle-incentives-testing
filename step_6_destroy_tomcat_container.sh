#!/usr/bin/env bash

figlet -f standard -w 180 "Destroy Tomcat Image"

docker-compose -f docker-compose-incentives-integration-testing.yml down

rm -rf logs_tomcat *.out* *.properties