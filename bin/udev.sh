#!/bin/bash

echo "[gammu]"							>  /Users/maruen/Local/gammu/ttys/gammurc-$1
echo "port=/dev/$1"					>> /Users/maruen/Local/gammu/ttys/gammurc-$1
echo "connection=at"					>> /Users/maruen/Local/gammu/ttys/gammurc-$1

echo "#Vendor id is $ID_VENDOR" 	>>	/Users/maruen/Local/gammu/ttys/gammurc-$1
echo "#Kernel name is $1" 			>> /Users/maruen/Local/gammu/ttys/gammurc-$1
echo "#kernel major is $2" 			>>	/Users/maruen/Local/gammu/ttys/gammurc-$1
echo "#kernel minor is $3"			>>	/Users/maruen/Local/gammu/ttys/gammurc-$1
echo "#name is $4" 					>>	/Users/maruen/Local/gammu/ttys/gammurc-$1
echo "#links is $5"					>>	/Users/maruen/Local/gammu/ttys/gammurc-$1
echo "#path is $6" 					>>	/Users/maruen/Local/gammu/ttys/gammurc-$1
echo "#id is $7" 						>>	/Users/maruen/Local/gammu/ttys/gammurc-$1
 
