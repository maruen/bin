#!/bin/bash

if [ "$#" -ne 1 ]
then
  echo "Illegal number of parameters"
  exit 1
fi

#ssh atsms@186.223.215.251 -p2224  "sendsms.py CLARO-01 +5511984388499 $1"
#ssh atsms@186.223.215.251 -p2224  "sendsms.py CLARO-03 +5511984388499 $1"

python sendsms.py CLARO-01 +5511984388499 "$1"
python sendsms.py CLARO-02 +5511984388499 "$1"
python sendsms.py CLARO-03 +5511984388499 "$1"
python sendsms.py CLARO-04 +5511984388499 "$1"
python sendsms.py CLARO-05 +5511984388499 "$1"
