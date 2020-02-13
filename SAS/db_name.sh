#!/bin/bash

#db_name="$(grep -oP 'DB_NAME="\K[^"]*' Params)"

db_name="$1"
SAS_PATH="$2"
SAS_META_PATH="$3"

cd $SAS_PATH
echo db_nm_ Read Receipt... "$db_name"

sed -i -r  "s/(.*:.*:\/\/.*\/).*?/\1"$db_name"/" sasws.properties 

cd $SAS_META_PATH

sed -i -r  "/name=\"hibernate\.connection\.url\"/ s/(.*:.*:\/\/.*\/)(.*?)(\"\s\/>)/\1"$db_name"\3/" persistence.xml
