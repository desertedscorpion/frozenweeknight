#!/bin/bash

while ! git push origin master
do
    sleep 1m &&
	true
done &&
    true
