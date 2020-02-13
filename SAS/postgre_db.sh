#!/bin/bash 

#postgre_db="$(grep -oP 'POSTGRE_DB="\K[^"]*' Params)"

postgre_db="$1"
SAS_PATH="$2"
SAS_META_PATH="$3"
cd $SAS_PATH

echo pstgr_db_ Read Receipt... "$postgre_db"

sed -i -r "s/(=.*:.*:\/\/)(..?)(\..*)/\1"$postgre_db"\3/"  sasws.properties

cd $SAS_META_PATH

sed -i -r "/name=\"hibernate\.connection\.url\"/s/(.*:.*:\/\/)(..?)(\..*)/\1"$postgre_db"\3/" persistence.xml
