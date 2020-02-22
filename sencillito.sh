#!/bin/bash


if [ "$1" = "-s" ]; then
	curl -si https://www.sencillito.com/utilities | grep -Eo "\"code\":[0-9]{4},\"title\":\"[a-zA-Z0-9_]+( [a-zA-Z0-9_\-]+)*\"" | sort -u | grep -i "$2"
	#TODO fix ticks 
fi
