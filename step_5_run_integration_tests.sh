#!/usr/bin/env bash

figlet -f standard -w 160 "Build, Deploy, and Integration Test"
date

echo "Fix datasource.properties to point to Oracle database created"
cp  src/main/resources/docker-tomcat/datasource.properties /tmp/datasource.properties
sed -i 's/HOST=oracle/HOST='$echo`cat ./.DNS_NAME`'/g' /tmp/datasource.properties
sed -i 's/SERVICE_NAME=EE.oracle.docker/SERVICE_NAME=SAMPLEDB/g' /tmp/datasource.properties

echo "Fix infrastructure.properties to point to Oracle database created"
cp  src/main/resources/docker-tomcat/infrastructure.properties /tmp/infrastructure.properties
sed -i 's/HOST=oracle/HOST='$echo`cat ./.DNS_NAME`'/g' /tmp/infrastructure.properties
sed -i 's/SERVICE_NAME=EE.oracle.docker/SERVICE_NAME=SAMPLEDB/g' /tmp/infrastructure.properties

echo "Hack war file to include property files for Tomcat deployment"
rm -rf temp
unzip src/main/resources/docker-tomcat/incentivesweb-2019.04-SNAPSHOT.war -d temp > /dev/null
rm temp/WEB-INF/lib/ojdbc-11g.jar
cp lib/ojdbc6.jar temp/WEB-INF/lib/.
cp /tmp/datasource.properties temp/WEB-INF/classes/.
cp src/main/resources/docker-tomcat/incentives.properties temp/WEB-INF/classes/.
cp /tmp/infrastructure.properties temp/WEB-INF/classes/.
cp src/main/resources/docker-tomcat/log4j.xml temp/WEB-INF/classes/.
cd temp
jar -cvf ../incentivesweb.war * > /dev/null
cd ..
rm -rf temp

docker logs tomcat 2> temp >/dev/null
deploys_start=$(grep -c "Deployment of web application archive /opt/tomcat/webapps/incentivesweb.war has finished" temp)
docker cp incentivesweb.war tomcat:/opt/tomcat/webapps/incentivesweb.war
echo "Waiting for incentivesweb application to deploy"
while true ; do
  docker logs tomcat 2> temp >/dev/null
  deploys_current=$(grep -c "Deployment of web application archive /opt/tomcat/webapps/incentivesweb.war has finished" temp)
  if [ "$deploys_current" -gt "$deploys_start" ] ; then
    echo "READY TO ROCK AND ROLL!"
    break
  fi
  sleep 10
done
date

rm -rf temp incentivesweb.war

echo Smoke test
date
echo "curl localhost:8080/incentivesweb/incentives/en/memberPlan/121938900?processingDate=2019-04-19"
curl localhost:8080/incentivesweb/incentives/en/memberPlan/121938900?processingDate=2019-04-19
date
#echo "curl -s http://localhost:8080/passwordAPI/passwordDB"
#curl -s http://localhost:8080/passwordAPI/passwordDB > ./.temp
#if grep -q "RESULT_SET" ./.temp
#then
#    echo "SMOKE TEST SUCCESS"
#    figlet -f slant -w 120 "Smoke Test Success"

#    echo "Configuring test application to point to Tomcat endpoint"
#    echo "hosturl=http://localhost:8080" > rest_webservice.properties

#    echo "Run integration tests"
#    mvn -q verify failsafe:integration-test
#else
#    echo "SMOKE TEST FAILURE!!!"
#    figlet -f slant -w 120 "Smoke Test Failure"
#fi
#rm ./.temp

