#!/bin/bash

#indxs_path="$(grep -oP 'INDEXES_PATH="\K[^"]*' Params)"

indxs_path="$1"
P2P_PATH="$2"

cd $P2P_PATH

echo indxs_path_ Read Receipt... "$indxs_path" 
 
 sed -i -r  "/indexesPath/ s/(\s=\s).*/\1$indxs_path/g" balistika2010p2p.properties
