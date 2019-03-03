#!/bin/bash
set -ex

#read a number of bytes from the microblaze bram memory
#argument 1: filename
#argument 2: size (<32kB)

./hold_mb.sh
./lock_bram.sh
sleep 1

./ps_mem_util.elf r $1 0x40000000 $2
