#!/bin/bash
set -ex

#set the bram mux to "ps" so that the ps can read/write the mb bram.
#turn pin 12 of axi GPIO high

echo 1020 > /sys/class/gpio/export || true
echo out > /sys/class/gpio/gpio1020/direction 
echo 1 > /sys/class/gpio/gpio1020/value

