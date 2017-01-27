#!/bin/bash

SQUID_FILE=$(cat squid.conf)
ALLOWED_IPS_FILE=$(cat allowed_ips.txt)
USERNAME=$1
HOST=$2
PASSWORD=$3


sshpass -p $PASSWORD ssh $USERNAME@$HOST 'bash -s' << EOF
	apt-get update -y
	apt-get install squid -y
	if ls /etc/squid/squid.conf 1> /dev/null 2>&1; then
		mv /etc/squid/squid.conf /etc/squid/squid.conf.original
	fi
	echo "$SQUID_FILE" >> /etc/squid/squid.conf
	echo "$ALLOWED_IPS_FILE" >> /etc/squid/allowed_ips.txt
	service squid restart
EOF