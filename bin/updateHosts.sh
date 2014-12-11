#!/bin/bash

if [ "$#" -ne 1 ]
then
    echo "Illegal number of parameters, you must specify the cluster to update"
    exit 1
fi

CUR_DIR=`pwd`
HOSTS_FILE=`scp root@96.126.114.91:"/etc/hosts /etc/hosts.ipv6"  .`
HOSTS=`sed -rn '/([0-9]{1,3}\.){3}[0-9]{1,3}/p' hosts`
CUR_IP=`curl --silent ifconfig.me`
HOSTS_UPDATED=`cat hosts.ipv6 > hosts`
HOSTS_TMP=`echo "${HOSTS}" > hosts.tmp`
IP_CHANGED=0

while read LINE
do
   IP=`echo ${LINE} | awk '{print $1}'`
   NAME=`echo ${LINE} | awk '{print $2}'` 

   if [ "${NAME}" == "$1" ];
   then
        echo "${CUR_IP} ${NAME}" >> ${CUR_DIR}/hosts

		  if [ "${IP}" != "${CUR_IP}" ];
		  then
		  		IP_CHANGED=1
		  		PREVIOUS_IP=${IP}
  		  fi 			 
   else
        echo "${IP} ${NAME}" >> ${CUR_DIR}/hosts
   fi

done < ${CUR_DIR}/hosts.tmp

REMOVE_TMP_FILE=`rm ${CUR_DIR}/hosts.tmp`
REMOVE_IPV6_FILE=`rm ${CUR_DIR}/hosts.ipv6`
NOW=$(date +"%d/%m/%Y %T")

if [ "${IP_CHANGED}" == "1" ]  && [ "${CUR_IP}" != "" ];
then
	echo "${NOW}: The IP of $1 has changed from ${PREVIOUS_IP} to ${CUR_IP}, uploading the new hosts file to root@96.126.114.91:/etc/hosts"
	REPLACE_HOSTS=`scp ${CUR_DIR}/hosts root@96.126.114.91:/etc/hosts`
else
	echo "${NOW}: There was no changing of IP, nothing done!"	
fi

REMOVE_HOSTS_FILE=`rm ${CUR_DIR}/hosts`



