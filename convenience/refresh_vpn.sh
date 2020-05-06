#!/bin/bash

# script restarts networking, then restarts vpn agent daemon

echo -n "stopping NetworkManager... "
sudo systemctl stop NetworkManager.service
echo "done."
echo -n "waiting 3 seconds... "
sleep 3
echo "done."
echo -n "starting NetworkManager... "
sudo systemctl start NetworkManager.service
echo "done."
echo -n "waiting 10 seconds for network to stabilize... "
sleep 10
echo "done."
echo -n "restarting Cisco Anyconnect agent daemon... "
sudo systemctl restart vpnagentd.service
echo "done."
