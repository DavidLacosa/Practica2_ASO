#!/bin/bash
#first argument is the pid
#second argument is the sleeping time
kill -STOP "$1"
sleep "$2"s
kill -CONT "$1"
