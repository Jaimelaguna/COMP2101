#!/bin/bash
interface="ens33"
network_address=$(ip route list dev $interface scope link|cut -d ' ' -f 1)
echo "network address:  $network_address"
network_number=$(cut -d / -f 1 <<<"$network_address")
echo "Network Number $network_number"
network_number=$(echo $network_number | awk '{print $1}')
echo "Network Number $network_number"
network_name=$(getent networks $network_number|awk '{print $1}')
echo "$(getent networks $network_number)"
echo "Netwoork name: $network_name"
