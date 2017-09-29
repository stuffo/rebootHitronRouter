#!/bin/bash 
# 
# reboot a Hitron CGN3 router 
# Also called Rogers Rocket CGN3 Modem
# Tested with CGN3ACSMR Hardware Revision A1 and Software Revision 4.5.8.27
#
# by https://github.com/stuffo/
#

router_ip="192.168.100.1"       # your router IP
username="cusadmin"             # username of admin user
password="password"             # default password, you may have changed this

login_ret=$(curl -s -i -d "user=$username" -d "pws=$password" http://$router_ip/goform/login | grep 'userid=' | cut -f2 -d=|cut -f1 -d';')
if [ -n "$login_ret" ] ; then
    echo "Logged in. Userid: $login_ret"
    reboot_ret=$(curl -i -s -b "userid=$login_ret;" -d 'model={"reboot":"1"}' http://$router_ip/goform/Reboot | head -1)
    if [ "$reboot_ret" == "HTTP/1.1 200 OK" ] ; then
        echo "reboot succeeded"
        exit 0
    else 
        echo "reboot failed: $reboot_ret"
    fi
else
    echo "Failed to login"
fi

exit 1

