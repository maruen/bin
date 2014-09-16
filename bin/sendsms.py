#!/usr/bin/env python

from asterisk import manager
import sys
import time
import re
 
# Asterisk manager credentials
HOST = '127.0.0.1'
USER = 'admin'
PASS = '13shua'
 
CMD = "dongle sms %s %s %s"
 
SENT_MSG = 'SENT'
NOT_SENT_MSG = 'NOT SENT'
ERROR_MSG = 'ERROR'
TIMEOUT_MSG = 'TIMEOUT'
TIMEOUT = 120 #seconds
 
status = {}
 
def handle_event(event, manager):
    global status
    message_id = event.headers['ID']
    if event.headers['Status'] == 'Sent':
        status[message_id] = SENT_MSG
    else:
        status[message_id] = NOT_SENT_MSG
 
if __name__ == '__main__':
        mgr = manager.Manager()
        mgr.connect(HOST)
        mgr.login(USER, PASS)
 
        mgr.register_event('DongleSMSStatus', handle_event)
 
        command = mgr.command(CMD % (sys.argv[1], sys.argv[2], sys.argv[3]))
 
        m = re.search('0x[0-9a-fA-F]+', command.data)
        if not m:
                print ERROR_MSG
                sys.exit(1)
 
        message_id = m.group(0)
 
        timeout = 0
        while(message_id not in status.keys()):
            if timeout >= TIMEOUT:
                print TIMEOUT_MSG
                sys.exit(1)
            time.sleep(0.1)
            timeout = timeout + 0.1
 
        print status[message_id]
 
        mgr.close()

