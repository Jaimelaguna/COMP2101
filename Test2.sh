#!/bin/bash
interface="ens33"
network_address=$(ip route list dev $interface scope link|cut -d ' ' -f 1)
network_number=$(cut -d / -f 1 <<<"$network_address")
echo $network_number
network_name=$(getent networks $network_number|awk '{print $1}')
echo $network_name
