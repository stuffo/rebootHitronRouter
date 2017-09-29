# rebootHitronRouter

Description
===========
Using this script you can reboot your Hitron CGN3 router via command line. 
Rogers in Canada sold this router as Rogers Rocket CGN3 cable modem/router.

How to use
==========
You need cURL and bash. Edit the script if you have a non-default router IP,
username or password. Just execute the script and the router should reboot.

Motivation
==========
Even after several software upgrades this routers keeps crapping. The symptoms
are very high packet loss and the connection seems slow. 
A simple reboot always fixes the problem for me. I just run this script via 
cron every night to refresh the router daily.
