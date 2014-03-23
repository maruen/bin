#!/bin/bash
PROGRAM="curl"
URL="http://127.0.0.1:9000/sms?phone=PHONE&date=DATE&message=TEXT&alias=ALIAS"

PHONE=$1
DATE=$2
ALIAS=$3
MESSAGE=$@
TEXT=`${MESSAGE} | sed -f urlencode.sed`


SMS_URL=`echo ${URL} | sed "s/PHONE/${PHONE}/" | sed "s/DATE/${DATE}/" | sed "s/TEXT/${TEXT}/" | sed "s/ALIAS/${ALIAS}/`
echo "SMS[Telefone: ${PHONE}, Data: ${DATE}, Alias: ${ALIAS} , Texto: ${TEXT} ]"		
echo "URL: ${URL}" 
CMD="$PROGRAM $SMS_URL"
echo "CMD: ${CMD}"
${CMD} 
