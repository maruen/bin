#!/bin/bash

if [ "$#" -ne 1 ]
then
  echo "Illegal number of parameters, testVIVODongles <MESSAGE>"
  exit 1
fi

RESULT1=`python sendsms.py VIVO-01 +5511984388499 "$1"` 
RESULT2=`python sendsms.py VIVO-02 +5511984388499 "$1"`
RESULT3=`python sendsms.py VIVO-03 +5511984388499 "$1"` 
RESULT4=`python sendsms.py VIVO-04 +5511984388499 "$1"`
RESULT5=`python sendsms.py VIVO-05 +5511984388499 "$1"`

echo "Testing VIVO-01  : $RESULT1"  
echo "Testing VIVO-02  : $RESULT2"  
echo "Testing VIVO-03  : $RESULT3"  
echo "Testing VIVO-04  : $RESULT4" 
echo "Testing VIVO-05  : $RESULT5"
