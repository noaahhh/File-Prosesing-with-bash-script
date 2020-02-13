#!/bin/bash

#table_prefix="$(grep -oP 'TABLE_PREFIX="\K[^"]*' Params)"

table_prefix="$1"
DAIM_PATH="$2"

cd $DAIM_PATH
echo Tbl_Prefx_ Read Receipt... "$table_prefix"

sed  -i -r "s/(>).*(_.*)/\1$table_prefix\2/g" balistika2010-site.xml 
 
