#!/bin/bash

#server="$(grep -oP 'SERVER="\K[^"]*' Params)"

server="$1"
SAS_PATH="$2" 

cd $SAS_PATH

 echo srvr_ Read Receipt... "$server"

sed -i -r  "s/(\/\/|server=)(.*?)(\\\:8080\/balistika|:8080\/manager|:8080)/\1"$server"\3/" sasws.properties

sed -i -r  "/master.host0/ s/(\s=\s).*/\1$server/" balistika2010p2p.properties 
