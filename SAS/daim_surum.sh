#!/bin/bash

#daim_surum="$(grep -oP 'DAIM_SURUM="\K[^"]*' Params)"

daim_surum="$1"
SAS_PATH="$2"

cd $SAS_PATH

echo daim_srm_ Read Receipt... "$daim_surum"

sed -i -r  "s/(:8080\/)(.*?)(\/daim\?wsdl)/\1"$daim_surum"\3/" sasws.properties

 #sed -n -r  "/tomcat\.manager\.url/ s/=http:\/\/(.*?):..../\1/g" sasws.properties
 
