#!/usr/bin/env bash

figlet -f standard -w 180 "Provision Oracle Database"

figlet -f slant -w 160 "Load Incentives Schema"
date

rm -rf ./sqlplus-out
mkdir sqlplus-out
mkdir sqlplus-out/CSID
mkdir sqlplus-out/ODS
mkdir sqlplus-out/INCV

#toally hackful - having trouble reliably running sqlplus on OSX
export ORACLE_BASE=/usr/local/Oracle
export ORACLE_HOME=$ORACLE_BASE/product/instantclient/11.2.0.4.0
export DYLD_LIBRARY_PATH=$ORACLE_HOME/lib
export TNS_ADMIN=$ORACLE_BASE/admin/network

echo "src/main/db/ddl_users.sql"
sqlplus oracleuser/password@$echo`cat ./.DNS_NAME`:1521/SAMPLEDB @src/main/db/ddl_users.sql > ./sqlplus-out/ddl_users.out

echo "src/main/db/CSID/ddl_csid_tables.sql"
sqlplus CSID/CSID@$echo`cat ./.DNS_NAME`:1521/SAMPLEDB @src/main/db/CSID/ddl_csid_tables.sql > ./sqlplus-out/CSID/ddl_csid_tables.out
echo "src/main/db/CSID/ddl_csid_grants.sql"
sqlplus CSID/CSID@$echo`cat ./.DNS_NAME`:1521/SAMPLEDB @src/main/db/CSID/ddl_csid_grants.sql > ./sqlplus-out/CSID/dl_csid_grants.out

echo "src/main/db/ODS/ddl_ods_types.sql"
sqlplus ODS/ODS@$echo`cat ./.DNS_NAME`:1521/SAMPLEDB @src/main/db/ODS/ddl_ods_types.sql > ./sqlplus-out/ODS/ddl_ods_types.out1
echo "src/main/db/ODS/ddl_ods_tables.sql"
sqlplus ODS/ODS@$echo`cat ./.DNS_NAME`:1521/SAMPLEDB @src/main/db/ODS/ddl_ods_tables.sql > ./sqlplus-out/ODS/ddl_ods_tables.out1
echo "src/main/db/ODS/ddl_ods_seq.sql"
sqlplus ODS/ODS@$echo`cat ./.DNS_NAME`:1521/SAMPLEDB @src/main/db/ODS/ddl_ods_seq.sql > ./sqlplus-out/ODS/ddl_ods_seq.out1
echo "src/main/db/ODS/ddl_ods_procs.sql"
sqlplus ODS/ODS@$echo`cat ./.DNS_NAME`:1521/SAMPLEDB @src/main/db/ODS/ddl_ods_procs.sql > ./sqlplus-out/ODS/ddl_ods_procs.out1
echo "src/main/db/ODS/ddl_ods_functions.sql"
sqlplus ODS/ODS@$echo`cat ./.DNS_NAME`:1521/SAMPLEDB @src/main/db/ODS/ddl_ods_functions.sql > ./sqlplus-out/ODS/ddl_ods_functions.out1
echo "src/main/db/ODS/ddl_ods_packages.sql"
sqlplus ODS/ODS@$echo`cat ./.DNS_NAME`:1521/SAMPLEDB @src/main/db/ODS/ddl_ods_packages.sql > ./sqlplus-out/ODS/ddl_ods_packages.out1

echo "src/main/db/ODS/ddl_ods_types.sql"
sqlplus ODS/ODS@$echo`cat ./.DNS_NAME`:1521/SAMPLEDB @src/main/db/ODS/ddl_ods_types.sql > ./sqlplus-out/ODS/ddl_ods_types.out2
echo "src/main/db/ODS/ddl_ods_tables.sql"
sqlplus ODS/ODS@$echo`cat ./.DNS_NAME`:1521/SAMPLEDB @src/main/db/ODS/ddl_ods_tables.sql > ./sqlplus-out/ODS/ddl_ods_tables.out2
echo "src/main/db/ODS/ddl_ods_seq.sql"
sqlplus ODS/ODS@$echo`cat ./.DNS_NAME`:1521/SAMPLEDB @src/main/db/ODS/ddl_ods_seq.sql > ./sqlplus-out/ODS/ddl_ods_seq.out2
echo "src/main/db/ODS/ddl_ods_procs.sql"
sqlplus ODS/ODS@$echo`cat ./.DNS_NAME`:1521/SAMPLEDB @src/main/db/ODS/ddl_ods_procs.sql > ./sqlplus-out/ODS/ddl_ods_procs.out2
echo "src/main/db/ODS/ddl_ods_functions.sql"
sqlplus ODS/ODS@$echo`cat ./.DNS_NAME`:1521/SAMPLEDB @src/main/db/ODS/ddl_ods_functions.sql > ./sqlplus-out/ODS/ddl_ods_functions.out2
echo "src/main/db/ODS/ddl_ods_pacjages.sql"
sqlplus ODS/ODS@$echo`cat ./.DNS_NAME`:1521/SAMPLEDB @src/main/db/ODS/ddl_ods_packages.sql > ./sqlplus-out/ODS/ddl_ods_packages.out2

echo src/main/db/ODS/ddl_ods_grants.sql""
sqlplus ODS/ODS@$echo`cat ./.DNS_NAME`:1521/SAMPLEDB @src/main/db/ODS/ddl_ods_grants.sql > ./sqlplus-out/ODS/ddl_ods_grants.out

echo "src/main/db/INCV/ddl_incv_types.sql"
sqlplus INCV/INCV@$echo`cat ./.DNS_NAME`:1521/SAMPLEDB @src/main/db/INCV/ddl_incv_types.sql > ./sqlplus-out/INCV/ddl_incv_types.out1
echo "src/main/db/INCV/ddl_incv_tables.sql"
sqlplus INCV/INCV@$echo`cat ./.DNS_NAME`:1521/SAMPLEDB @src/main/db/INCV/ddl_incv_tables.sql > ./sqlplus-out/INCV/ddl_incv_tables.out1
echo "src/main/db/INCV/ddl_incv_seq.sql"
sqlplus INCV/INCV@$echo`cat ./.DNS_NAME`:1521/SAMPLEDB @src/main/db/INCV/ddl_incv_seq.sql > ./sqlplus-out/INCV/ddl_incv_seq.out1
echo "src/main/db/INCV/ddl_incv_packages.sql"
sqlplus INCV/INCV@$echo`cat ./.DNS_NAME`:1521/SAMPLEDB @src/main/db/INCV/ddl_incv_packages.sql > ./sqlplus-out/INCV/ddl_incv_packages.out1
echo "src/main/db/INCV/ddl_incv_procedures.sql"
sqlplus INCV/INCV@$echo`cat ./.DNS_NAME`:1521/SAMPLEDB @src/main/db/INCV/ddl_incv_procedures.sql > ./sqlplus-out/INCV/ddl_incv_procedures.out1
echo "src/main/db/INCV/ddl_incv_views.sql"
sqlplus INCV/INCV@$echo`cat ./.DNS_NAME`:1521/SAMPLEDB @src/main/db/INCV/ddl_incv_views.sql > ./sqlplus-out/INCV/ddl_incv_views.out1

echo "src/main/db/INCV/ddl_incv_types.sql"
sqlplus INCV/INCV@$echo`cat ./.DNS_NAME`:1521/SAMPLEDB @src/main/db/INCV/ddl_incv_types.sql > ./sqlplus-out/INCV/ddl_incv_types.out2
echo "src/main/db/INCV/ddl_incv_tables.sql"
sqlplus INCV/INCV@$echo`cat ./.DNS_NAME`:1521/SAMPLEDB @src/main/db/INCV/ddl_incv_tables.sql > ./sqlplus-out/INCV/ddl_incv_tables.out2
echo "src/main/db/INCV/ddl_incv_seq.sql"
sqlplus INCV/INCV@$echo`cat ./.DNS_NAME`:1521/SAMPLEDB @src/main/db/INCV/ddl_incv_seq.sql > ./sqlplus-out/INCV/ddl_incv_seq.out2
echo "src/main/db/INCV/ddl_incv_packages.sql"
sqlplus INCV/INCV@$echo`cat ./.DNS_NAME`:1521/SAMPLEDB @src/main/db/INCV/ddl_incv_packages.sql > ./sqlplus-out/INCV/ddl_incv_packages.out2
echo "src/main/db/INCV/ddl_incv_procedures.sql"
sqlplus INCV/INCV@$echo`cat ./.DNS_NAME`:1521/SAMPLEDB @src/main/db/INCV/ddl_incv_procedures.sql > ./sqlplus-out/INCV/ddl_incv_procedures.out2
echo "src/main/db/INCV/ddl_incv_views.sql"
sqlplus INCV/INCV@$echo`cat ./.DNS_NAME`:1521/SAMPLEDB @src/main/db/INCV/ddl_incv_views.sql > ./sqlplus-out/INCV/ddl_incv_views.out2

date

figlet -f slant -w 160 "Load Incentives Data"

echo "src/test/db/ODS/dml_ods_setup.sql"
sqlplus INCV/INCV@$echo`cat ./.DNS_NAME`:1521/SAMPLEDB @src/test/db/ODS/dml_ods_setup.sql > ./sqlplus-out/ODS/dml_ods_setup.out
echo "src/test/db/INCV/dml_incv_setup.sql"
sqlplus INCV/INCV@$echo`cat ./.DNS_NAME`:1521/SAMPLEDB @src/test/db/INCV/dml_incv_setup.sql > ./sqlplus-out/INCV/dml_incv_setup.out
echo "src/test/db/ODS/dml_ods_member.sql"
sqlplus INCV/INCV@$echo`cat ./.DNS_NAME`:1521/SAMPLEDB @src/test/db/ODS/dml_ods_member.sql > ./sqlplus-out/ODS/dml_ods_member.out
echo "src/test/db/INCV/dmlincv_program_setup.sql"
sqlplus INCV/INCV@$echo`cat ./.DNS_NAME`:1521/SAMPLEDB @src/test/db/INCV/dml_incv_program_setup.sql > ./sqlplus-out/INCV/dml_incv_program_setup.out

date
