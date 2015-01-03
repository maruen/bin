#!/bin/bash

if [ "$#" -ne 1 ]
then
  echo "Illegal number of parameters, testOIDongles <MESSAGE>"
  exit 1
fi

RESULT1=`python sendsms.py OI-01 +5511984388499 "$1"` 
RESULT2=`python sendsms.py OI-02 +5511984388499 "$1"`
RESULT3=`python sendsms.py OI-03 +5511984388499 "$1"` 
RESULT4=`python sendsms.py OI-04 +5511984388499 "$1"`
RESULT5=`python sendsms.py OI-05 +5511984388499 "$1"`

echo "Testing OI-01    : $RESULT1"  
echo "Testing OI-02    : $RESULT2"  
echo "Testing OI-03    : $RESULT3"  
echo "Testing OI-04    : $RESULT4" 
echo "Testing OI-05    : $RESULT5"
