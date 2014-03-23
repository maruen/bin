#!/bin/bash
. /home/sms_system/sms_system.cfg
if [ ! -e $PHONE_DEVICE ]; then
    if [ -e /dev/ttyACM* ]; then
	writelog "testmobile: $PHONE_DEVICE not found"
	writelog "testmobile: Found some ACM"
	ACM_DEVICE=`ls /dev/ttyACM* | head -1`
	writelog "testmobile: Linking to $ACM_DEVICE"
	ln -sf $ACM_DEVICE $PHONE_DEVICE
	if [ $? -eq 0 ]; then
	    [ -e /tmp/mobiledead ] && rm /tmp/mobiledead
	    writelog "testmobile: Linking succeeded"
	    exit 0
	else
	    writelog "testmobile: Linking failed"
	    exit 1
	fi
    elif [ ! -e /tmp/mobiledead ]; then
	writelog "testmobile: No mobile and no mobiledead, failing"
	touch /tmp/mobiledead
	exit 1
    else
	exit 0
    fi
else 
    [ -e /tmp/mobiledead ] && rm /tmp/mobiledead && writelog "testmobie: Mobile found, removing mobiledead"
    exit 0
fi
