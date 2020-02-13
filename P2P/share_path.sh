#!/bin/bash


#share_path="$(grep -oP 'SHARE_PATH="\K[^"]*' Params)"
share_path="$1"
P2P_PATH="$2"

cd $P2P_PATH 
echo shr_path_ Read Receipt... "$share_path"
 
sed -i -r  "/sharePath/ s/(\s=\s).*/\1$share_path/" balistika2010p2p.properties 
