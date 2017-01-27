#!/bin/bash

HOSTS=$(cat hosts)

for HOST in ${HOSTS} ; do
	HEAD=$(echo $HOST | awk -F ":" '{print $2}')
	if  [[ "$HEAD" == "ip" ]]; then
		continue
	fi
	echo "start $(echo $HOST | awk -F ":" '{print $2}')"
	/bin/bash install_squid.sh $(echo $HOST | awk -F ":" '{print $1}') $(echo $HOST | awk -F ":" '{print $2}') $(echo $HOST | awk -F ":" '{print $3}')
	echo "finished $(echo $HOST | awk -F ":" '{print $2}')"
	echo '*****************************************\n\n'
done

echo 'finish all hosts'
