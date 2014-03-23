#!/bin/bash

expr="s|$2|$3|g";

while read line
do
    echo "Processing the file $line";
    sed -e $expr $line > $line.temp; 
    mv $line.temp $line;
done < $1
