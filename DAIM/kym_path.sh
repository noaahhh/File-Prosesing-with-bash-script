#!/bin/bash

#kym_path="$(grep -oP 'KYM_PATH="\K[^"]*' Params)"

kym_path="$1"
DAIM_PATH="$2"

cd $DAIM_PATH

echo kym_pth_ Read Receipt... "$kym_path"

var_3=$(sed -n -r  "/<name>balistika\.kym\.lib\.path<\/name>/ {n;s/^\s*<value>(.*?)<\/value>/\1/g;p}" balistika2010-kym-site.xml)


sed -i "s@$var_3@$kym_path@g" balistika2010-kym-site.xml

