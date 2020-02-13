#!/bin/bash


PERSONAL_PATH="/home/noaahhh/Desktop"

DAIM_PATH=""$PERSONAL_PATH"/Tomcat/Webappps/balistika2010-daim-ws-suba_3.1.1.3/WEB-INF/classes"

SAS_PATH=""$PERSONAL_PATH"/Tomcat/Webappps/balistika2010-sasws-suba_3.1.1.3/WEB-INF/classes/"

P2P_PATH=""$PERSONAL_PATH"/Tomcat/Webappps/balistika2010-p2p-ws-suba_3.1.1.3/WEB-INF/classes/"

SAS_META_PATH=""$PERSONAL_PATH"/Tomcat/Webappps/balistika2010-sasws-suba_3.1.1.3/WEB-INF/classes/META-INF/"

option="$1"


main () {
grep_read

#ARGUMENT COUNT CONTROL
if [ "$#" != "1" ]; then 
echo "-Invalid argument count: $#"
echo "-Usage $0( daim | sas | p2p | all )"

exit 1
fi

#DAIM
if [ "$option" = "daim" ]||[ "$option" = "all" ]; then  

 cd $PERSONAL_PATH/balistika2010_Tomcat_tool/DAIM

sh cluster_master_IP.sh $cluster_master_IP $DAIM_PATH 
sh table_prefix.sh $table_prefix $DAIM_PATH 
sh kym_path.sh $kym_path $DAIM_PATH

fi

#SAS
if [ "$option" = "sas" ]||[ "$option" = "all" ]; then  


 cd $PERSONAL_PATH/balistika2010_Tomcat_tool/SAS

sh server_name.sh $server $SAS_PATH
sh daim_surum.sh $daim_surum $SAS_PATH
sh db_name.sh $db_name $SAS_PATH $SAS_META_PATH
sh postgre_db.sh $postgre_db $SAS_PATH $SAS_META_PATH

fi

#P2P
if [ "$option" = "p2p" ]||[ "$option" = "all" ]; then  


 cd $PERSONAL_PATH/balistika2010_Tomcat_tool/P2P

sh share_path.sh $share_path $P2P_PATH
sh indexes_path.sh $indxs_path $P2P_PATH


fi

echo "\n"done...
}

grep_read ()
{
#--DAIM--
  if [ "$option" = "daim" ]||[ "$option" = "all" ]; then  

cluster_master_IP=$(grep -oP 'CLUSTER_MASTER_IP="\K[^"]*' Params)
table_prefix="$(grep -oP 'TABLE_PREFIX="\K[^"]*' Params)"
kym_path="$(grep -oP 'KYM_PATH="\K[^"]*' Params)"

fi
#--SAS--
if [ "$option" = "sas" ]||[ "$option" = "all" ]; then  

server="$(grep -oP 'SERVER="\K[^"]*' Params)"
daim_surum="$(grep -oP 'DAIM_SURUM="\K[^"]*' Params)"
postgre_db="$(grep -oP 'POSTGRE_DB="\K[^"]*' Params)"
db_name="$(grep -oP 'DB_NAME="\K[^"]*' Params)"

fi
#--P2P--
if [ "$option" = "p2p" ]||[ "$option" = "all" ]; then  

share_path="$(grep -oP 'SHARE_PATH="\K[^"]*' Params)"
indxs_path="$(grep -oP 'INDEXES_PATH="\K[^"]*' Params)"

fi

}
main "$@"

