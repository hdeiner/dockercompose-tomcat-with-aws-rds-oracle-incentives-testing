#!/usr/bin/env bash

figlet -f standard -w 180 "Create Tomcat Image"

docker rmi howarddeiner/incentives-tomcat
docker build src/main/resources/docker-tomcat -t howarddeiner/incentives-tomcat
