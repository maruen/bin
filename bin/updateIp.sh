#!/bin/bash

IP=`curl --silent ifconfig.me`

mysql -h 96.126.114.91 -u atsms -patsms atsms << EOF
update line set ssh_host='$IP'
EOF
