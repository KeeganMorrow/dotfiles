#!/usr/bin/env bash

ipfile="/tmp/last_ip_addr"
notifymail="Korrow@gmail.com"

ip=$(curl -s ipinfo.io/ip)
echo "IP is currently $ip"

if [ -f "$ipfile" ];then
    old_ip=$(cat "$ipfile")
    echo "Last IP was $ip"
else
    old_ip=""
fi

if [ "$ip" != "$old_ip" ]; then
    echo "IP has changed!"
    echo "$ip" > "$ipfile"
    echo "IP address is now $ip" | mail -s "IP Change" "$notifymail"
else
    echo "IP is the same"
fi
