#!/bin/bash

if [ "$#" -ne 1 ]
then
  echo "Illegal number of parameters"
  exit 1
fi

python sendsms.py OI-01 +5511984388499 "$1"
python sendsms.py OI-02 +5511984388499 "$1"
python sendsms.py OI-03 +5511984388499 "$1"
python sendsms.py OI-04 +5511984388499 "$1"
python sendsms.py OI-05 +5511984388499 "$1"