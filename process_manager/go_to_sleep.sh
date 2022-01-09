#!/bin/bash
#first argument is the pid
#second argument is the sleeping time
logger -p user.notice "[PROCESS MANAGER]: User slept $2 sec, process $1"
kill -STOP "$1"
sleep "$2"s
kill -CONT "$1"

