#!/usr/bin/env bash
ECE438_HOME=`git rev-parse --show-toplevel` 
HTTPSERVER_PORT=80
SERVER_IP='http://127.0.0.1'

cd "$ECE438_HOME/mp1"
make
./http_server $HTTPSERVER_PORT > /dev/null&
cp http_client test
cd test

echo "[Testcase] http_client URI with port"
for FILE in input/*;
do
	./http_client $SERVER_IP:$HTTPSERVER_PORT/test/$FILE > /dev/null
	if diff output $FILE > /dev/null
	then
		echo "PASS: $FILE"
	else
		echo "FAIL: $FILE"
	fi
done

echo "[Testcase] http_client URI without port"
for FILE in input/*;
do
	./http_client $SERVER_IP/test/$FILE > /dev/null
	if diff output $FILE > /dev/null
	then
		echo "PASS: $FILE"
	else
		echo "FAIL: $FILE"
	fi
done

pkill http_server > /dev/null