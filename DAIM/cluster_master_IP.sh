#!/bin/bash

#cluster_master_IP=$(grep -oP 'CLUSTER_MASTER_IP="\K[^"]*' Params)

cluster_master_IP="$1"
DAIM_PATH="$2"

cd "$DAIM_PATH"

#----cluster_master_IP-----

echo clu_mastr_IP_ Read Receipt... "$cluster_master_IP"

var_1="$(sed -n -r "/<name>fs.\default\.name<\/name>/ {n;s/^\s*<value>(.*?)\:XXXX<\/value>/\1/g;p}" core-site.xml)"

var_2="$(sed -n -r "/<name>mapred\.job\.tracker<\/name>/ {n;s/^\s*<value>(.*?)\:XXXX<\/value>/\1/g;p}" mapred-site.xml)"



sed -i "s@$var_1@$cluster_master_IP@g" core-site.xml 
#echo --------------------------------------
sed -i "s@$var_2@$cluster_master_IP@g" mapred-site.xml

 
