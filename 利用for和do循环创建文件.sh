#!/bin/bash
for id in {1..10}
do
	touch file$id
	wall "file$id is created"
	sleep 1
done
