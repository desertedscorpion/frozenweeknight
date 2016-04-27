#!/bin/bash

while ! git push origin
do
    sleep 1m &&
	true
done &&
    true
