#!/bin/bash

if [ "$#" -ne 1 ]
then
  echo "Illegal number of parameters, testCLARODongles <MESSAGE>"
  exit 1
fi

RESULT1=`python sendsms.py CLARO-01 +5511984388499 "$1"` 
RESULT2=`python sendsms.py CLARO-02 +5511984388499 "$1"`
RESULT3=`python sendsms.py CLARO-03 +5511984388499 "$1"` 
RESULT4=`python sendsms.py CLARO-04 +5511984388499 "$1"`
RESULT5=`python sendsms.py CLARO-05 +5511984388499 "$1"`

echo "Testing CLARO-01 : $RESULT1"  
echo "Testing CLARO-02 : $RESULT2"  
echo "Testing CLARO-03 : $RESULT3"  
echo "Testing CLARO-04 : $RESULT4" 
echo "Testing CLARO-05 : $RESULT5"
