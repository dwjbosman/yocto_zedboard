#!/bin/bash
set -ex

#program the microblaze bram. Argument: filename 
#filename is a binary image created with: mb-objcopy -I elf32-microblaze -O binary --strip-debug mb_test.elf mb_test.bin 

./hold_mb.sh
./lock_bram.sh
sleep 1

./ps_mem_util.elf w $1 40000000
