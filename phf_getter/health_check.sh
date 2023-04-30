#!/bin/bash


for kafka_server in "$@";
do
	ret=$(kafkacat -L -b $kafka_server  -t maria)
	printf "%s\n" $ret		
	while [[ $ret != *"Metadata"* ]];
	do
		printf "unsuccesful\n"
		ret=$(kafkacat -L -b $kafka_server  -t phf)
		sleep 1	
	done	
	printf "succesful for %s\n" $kafka_server

done    	 

exit 0
