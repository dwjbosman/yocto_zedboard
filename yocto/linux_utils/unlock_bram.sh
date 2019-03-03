#!/bin/bash
set -ex

#set BRAM mux to 'mb' allowing the microblaze to use the BRAM

#set pin 12 of AXI GPIO low

echo 1020 > /sys/class/gpio/export || true
echo out > /sys/class/gpio/gpio1020/direction 
echo 0 > /sys/class/gpio/gpio1020/value

