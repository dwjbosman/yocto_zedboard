#!/bin/bash
set -ex

#start microblaze
#set pin 13 of AXI GPIO low

echo 1021 > /sys/class/gpio/export || true
echo out > /sys/class/gpio/gpio1021/direction 
echo 0 > /sys/class/gpio/gpio1021/value

