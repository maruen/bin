#!/bin/bash

if [ "$#" -ne 1 ]
then
  echo "Illegal number of parameters"
  exit 1
fi

python sendsms.py VIVO-01 +5511984388499 "$1"
python sendsms.py VIVO-02 +5511984388499 "$1"
python sendsms.py VIVO-03 +5511984388499 "$1"
python sendsms.py VIVO-04 +5511984388499 "$1"
python sendsms.py VIVO-05 +5511984388499 "$1"
python sendsms.py VIVO-06 +5511984388499 "$1"
python sendsms.py VIVO-07 +5511984388499 "$1"
python sendsms.py VIVO-08 +5511984388499 "$1"
python sendsms.py VIVO-09 +5511984388499 "$1"
ssh atsms@186.223.215.251 -p2224  "sendsms.py VIVO-10 +5511984388499 $1"
python sendsms.py VIVO-11 +5511984388499 "$1"
