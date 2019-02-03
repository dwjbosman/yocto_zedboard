---
title: "Yocto linux on the Xilinx Zynq Zed board"
cover: "/logos/linux.png"
category: "FPGA"
tags: 
    - Zynq
      Yocto
      FPGA
      Linux
      Xilinx
date: 2019-01-12 09:00
---

# Introduction

In my previous article I discussed setting up a Microblaze processor which can run user applications in a bare metal environment. The advantage of using a bare metal approach is that software runs without any (undeterministic) operating system overhead. An obvious disadvantage is that you need to implement basic Operating System tasks (eg. file system access, memory management) yourself. 

In the earlier proposed synthesizer, I would like to develop the audio engine will run in real time. This engine will run partly on a Microblaze and will be implemented partly in custom FPGA logic. Besides audio processing the software will also need to implement systems management functions. Systems management will enable functions such as servicing an embedded website, providing firmware updates and voice patch editing. These functions can be implemented in a non Real Time environment. Furthermore the MIDI protocol can also be handled by a non Real Time environment as long as the latency is not too large. 

The described management functions can be implemented with ease on a Linux platform. In this article I will show how to get Linux up and running on a Xilinx Zynq Zed board. There are a number of tutorials around which describe Linux on the Zed board. This tutorial adds the following:

  * Use Yocto Linux
  * Use a device tree (dts/dtb) based upon the custom functionality implemented in the FPGA. This allows the Linux implementation to access the custom FPGA functions.

In this tutorial the programmable logic (PL) will be configured to contain a GPIO block connected via AXI to the ARM chips in the Zynq programmable system (PS). Linux will run on the PS and will be able to access the GPIO block in the PL.

The Yocto files and VHDL code can be found in the [yocto\_zedboard](https://github.com/dwjbosman/yocto_zedboard.git) repository.

![Yocto GPIO ZED board](resources/linux_board.gif "Yocto on ZED board")

# Design

In order to get Linux running on the Zed Board, I will be using the SD Card. On the SD card there are two partitions: boot and root. For the root filesystem I will be using Ubuntu. The boot partition needs the following files:
  
  * boot.bin : FSBL bootloader. This bootloader reads the FPGA bit file from the SD card boot partition (fpga.bin) and starts u-boot.
  * fpga.bin : FPGA logic fabric bitfile converted to bin format.
  * u-boot.img : u-boot Linux bootloader.
  * uEnv.txt : u-boot boot configuration.
  * uImage-system-top.dtb : Linux device tree,.
  * uImage : Yocto Linux Kernel.

Yocto can provide these files based on input coming from Xilinx Vivado and the Xilinx SDK. In Vivado the functions defined in the Zynq PL are exported via a device tree (dts file). This device tree is then compiled into a device tree blob (dtb file) when Yocto builds the Linux image. The Linux kernel can then provide an interface to the custom FPGA logic. In more details the steps are as follows:

 1. Define the block design in Vivado.
 1.1. Export the bit file to the Xilinx SDK
 2. Use the SDK to export a device tree source file (dts)  
 3. Convert the fpga bit file to a bin file (fpga.bin)
 4. Configure yocto to build a Linux kernel and boot files.
 4.1. Use Docker to run Yocto
 4.2. Add the meta-Xilinx layer to add support for the Zynq processor
 4.3. Add a custom layer which provides the custom device tree (dts) files
 5. Configure the root file system, using Ubuntu
 6. Formatting the SD card and store the required boot files

In the following sections the steps are described in more detail: 

# 1. Xilinx Zynq Block Design

The proof of concept consists of a GPIO block connected to the Zed board LEDs and switches. The GPIO block is connected to the PS via the AXI bus. One of the LEDs is connected to a counter which causes it to blink. The blinking LED was added so that you can see that the FPGA logic was programmed during booting. The Zynq PS needs the following features: DDR memory, UART (Linux terminal), SPI (SD card) and  Ethernet. 

The block design can be found in the github project. Start Vivado (I use version 2018.2), select the tools menu and execute the tcl script inside the vivado\_linux\_zynq/ folder. This will create the project. Next generate the .bit file.

## 1.1. Export .bit file

Use the 'export hardware' function in Vivado to hand over the hardware description to the Xilinx SDK.  In the SDK click on the  hw\_platform system.hdf file and not the address of the GPIO interface: 0x41200000.

# 2. Generate dts files

In order to generate a device tree (dts) file from the hardware description a separate Xilinx tool (device-tree-xlnx) is needed. This tool can be installed as an addon into the Xilinx SDK.

  1. clone the [device-tree-xlnx](https://github.com/Xilinx/device-tree-xlnx) project.
  2. In the Xlinix SDK open the Xilinx menu and open 'Repositories'. 
  3. Click the 'new' button next to the 'global repositories' section and select the path to the checked out git repo.
  4. Create a new Board Support Package project. In the 'target hardware' section choose the Vivado exported wrapper. In the 'board support package OS' drop down choose 'device tree'.
  5. The 'board support settings' window will open. Here you can select various driver and device tree options. I'm using kernel version 2018.3
  6. After selecting 'ok' a number of 'dts' and 'dtsi' files will be generated. The system-top.dts will be compiled into a device tree blob by Yocto. Examine the system-top.dts and find that it contains a number of includes. The included dtsi files are also required. The other files can be ignored. 

# 3. Generate fpga.bin from fpga.bit

Use the [bit to bin](https://github.com/topic-embedded-products/meta-topic/blob/master/recipes-bsp/fpga/fpga-bit-to-bin/fpga-bit-to-bin.py) conversion script to convert the bit file to a bin file suitable for flashing on the SD card.

# 4. Yocto Linux image

Yocto is a framework of tools to create custom embedded Linux distributions. Yocto consists of the embedded Linux distribution Poky and the OpenEmbedded (OE) build system. Yocto consists of layers. Each layer can add new features or modify existing features. A custom layer will be added to inject the dts files from the previous step.

In order to build a Linux image with Yocto a number of prerequisite tools need to be installed. In order to keep my PC clean, Docker is used to be able to install all dependencies without affecting my normal day-to-day work. The Docker file can be found in the repository.

   1. Clone the repository
   2. Copy the required dts and dtsi to the <pre>meta-dts/recipes-kernel/linux/linux-xlnx/zedboard-zynq7/</pre> folder.
   3. If needed update the <pre>meta-dts/recipes-kernel/linux/linux-xlnx_%.bbappend</pre> file to include the copied dts/dtsi files.
   4. cd in to the 'yocto' sub directory.
   5. Create the Docker image by running "make image". After this step is completed (which will take quite a long time!) the Docker image will contain the Linux image files for the Zed Board
   6. Run the "run.sh" script to create and log in to a Docker container. The script mounts your home dir inside the container so that you can copy files to and from the container.
   7. Copy the files inside /yocto/poky/build/tmp/deploy/images/zedboard-zynq7 to a folder in your home dir.

# 5. Configure root file system

I followed this blog on setting up an [Ubuntu Xenial rootfs](https://embeddedgreg.com/2017/06/17/creating-a-xenial-rootfs-for-zy). 
  * Don't follow the complete article. Skip the part on u-boot. U-boot is already provided by Yocto.
  * Do not forget to install sudo. 
    
# 6. Format the SD card

Use fdisk to setup the partitions on the SD card. Setup the following partition table:

<pre>
Device         Boot Start      End  Sectors  Size Id Type
/dev/mmcblk0p1 *        8    42605    42598 20,8M  c W95 FAT32 (LBA)
/dev/mmcblk0p2      42608 13833091 13790484  6,6G 83 Linux
</pre>

After partioning the SD card exit fdisk and mount the partitions. Use rsync to copy the rootfs to the second partition.

<pre>
sudo rsync -aAXv <path_to\_your\_rootfs>/* /path_to_mount_point_second_partition/
</pre>

Copy the following files from the yocto deploy/images directory (Yocto Linux image step 4) to the SD card boot partition:

<pre>
boot.bin  
u-boot.img  
uImage  
uImage-system-top.dtb
</pre>

Copy the converted fpga bit stream (step Generate fpga.bin from fpga.bit) to the boot partition:

<pre>
fpga.bin  
</pre>

Finally modify the uEnv.txt file generated by Yocto (so that it uses the new dtb file), and copy it to the boot partition:

<div style='overflow:auto;width:100%'>
<pre>
machine_name=zedboard-zynq7
kernel_image=uImage
kernel_load_address=0x2080000
devicetree_image=uImage-system-top.dtb
devicetree_load_address=0x2000000
bootargs=console=ttyPS0,115200 root=/dev/mmcblk0p2 rw earlyprintk rootfstype=ext4 rootwait devtmpfs.mount=1
loadkernel=fatload mmc 0 ${kernel_load_address} ${kernel_image}
loaddtb=fatload mmc 0 ${devicetree_load_address} ${devicetree_image}
bootkernel=run loadkernel && run loaddtb && bootm ${kernel_load_address} - ${devicetree_load_address}
uenvcmd=run bootkernel
</pre>
</div>


# 7. Booting

After copying the files to the SD card, unmount the paritions. Plug the SD card in the ZED board, connect the UART and power up the board. Use a terminal program (eg. GTK Term) to connect. I found that the ZED board needs some time to setup the serial connection. When the serial connection is finally available part of the boot process is already underway. Press the PS-RST button to restart the ZED board; this will keep the serial connection active. You should now see be able to follow the boot process through info provided by the FSBL boot loader, U-boot and finally Linux. Once the FSBL bootloader setsup the FPGA one of the LEDS should begin to blink.

Running 'dmesg' showed that my usb-serial adapter was configured as '/dev/ttyACMO'

<pre>gtkterm --port /dev/ttyACM0 --speed 115200</pre>

When the boot process finishes you should be able to login using the 'ubuntu' user and the password you set up earlier. Become superuser by running 

<pre>sudo -i -u root</pre>

# 8. Control the LEDs.

As noted from the system hdf file (step 1.1) the address of the GPIO interface is 0x41200000. Go to the '/sys/class/gpio' folder. Linux provides a GPIO interface through the sysfs system. 

<pre>
ubuntu@localhost:/sys/class/gpio$ ls
export  gpiochip1008  gpiochip1016  gpiochip890  unexport
</pre>

There are several gpio interfaces. For example the programable system (PS) also has GPIO. The FPGA GPIO will provide two interfaces. We can inspect the interfaces:

<pre>
ubuntu@localhost:/sys/class/gpio$ cat gpiochip1008/label
/amba_pl/gpio@41200000
ubuntu@localhost:/sys/class/gpio$ cat gpiochip1016/label
/amba_pl/gpio@41200000
</pre>

The address corresponds to the one specify by the hdf file. To use the interfaces:

<pre>
#enable the first two bits of the inputs 
echo 1008 > export
echo 1009 > export
#enable the first two bits of the outputs
echo 1016 > export
echo 1017 > export
</pre>

This will create a number for new IO files:

<div style='overflow:auto;width:100%'>
<pre>
root@localhost:/sys/class/gpio# ls -al
total 0
drwxr-xr-x  2 root root    0 Feb 11 17:05 .
drwxr-xr-x 45 root root    0 Feb 11 16:45 ..
--w-------  1 root root 4096 Feb 11 17:08 export
lrwxrwxrwx  1 root root    0 Feb 11 16:53 gpio1008 -> ../../devices/soc0/amba_pl/41200000.gpio/gpiochip1/gpio/gpio1008
lrwxrwxrwx  1 root root    0 Feb 11 17:02 gpio1009 -> ../../devices/soc0/amba_pl/41200000.gpio/gpiochip1/gpio/gpio1009
lrwxrwxrwx  1 root root    0 Feb 11 16:53 gpio1016 -> ../../devices/soc0/amba_pl/41200000.gpio/gpiochip0/gpio/gpio1016
lrwxrwxrwx  1 root root    0 Feb 11 17:02 gpio1017 -> ../../devices/soc0/amba_pl/41200000.gpio/gpiochip0/gpio/gpio1017
lrwxrwxrwx  1 root root    0 Feb 11 16:45 gpiochip1008 -> ../../devices/soc0/amba_pl/41200000.gpio/gpio/gpiochip1008
lrwxrwxrwx  1 root root    0 Feb 11 16:45 gpiochip1016 -> ../../devices/soc0/amba_pl/41200000.gpio/gpio/gpiochip1016
lrwxrwxrwx  1 root root    0 Feb 11 16:45 gpiochip890 -> ../../devices/soc0/amba/e000a000.gpio/gpio/gpiochip890
--w-------  1 root root 4096 Feb 11 17:05 unexport
</pre>
</div>

Set the direction of the outputs to 'out' ('in' is the default)

<pre>
echo out > gpio1016/direction
echo out > gpio1017/direction
</pre>

Turn on the LEDs:
<pre>
echo 1 > gpio1016/value
echo 1 > gpio1017/value
</pre>

Read out 2 switches:
<pre>
cat gpio1008/value
cat gpio1009/value
</pre>


