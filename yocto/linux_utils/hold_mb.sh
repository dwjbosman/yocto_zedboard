#!/bin/bash
set -ex

#hold the microblaze in reset by setting pin 13 of axi GPIO high.

echo 1021 > /sys/class/gpio/export || true
echo out > /sys/class/gpio/gpio1021/direction 
echo 1 > /sys/class/gpio/gpio1021/value

