#!/usr/bin/env bash
ECE438_HOME=`git rev-parse --show-toplevel` 
HTTPSERVER_PORT=80
SERVER_IP='http://172.17.0.2'

cd "$ECE438_HOME/mp1"
make

cd test/input

echo "[Testcase] URI with port"
for FILE in *;
do
	wget -O ../output $SERVER_IP:$HTTPSERVER_PORT/test/input/$FILE -q
	if diff ../output $FILE > /dev/null
	then
		echo "PASS: $FILE"
	else
		echo "FAIL: $FILE"
	fi
done

echo "[Testcase] URI without port"
for FILE in *;
do
	wget -O ../output $SERVER_IP/test/input/$FILE -q
	if diff ../output $FILE > /dev/null
	then
		echo "PASS: $FILE"
	else
		echo "FAIL: $FILE"
	fi
done
	
