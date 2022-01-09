#!/bin/bash
#creem la fifo en background i redirigim la sortida a /dev/null
mpg123 --remote --fifo /home/pi/audioControl > /dev/null &

