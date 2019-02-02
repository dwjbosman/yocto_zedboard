SRC_URI += "file://system-top.dts;subdir=git/arch/${ARCH}/boot/dts"
SRC_URI += "file://pcw.dtsi;subdir=git/arch/${ARCH}/boot/dts"
SRC_URI += "file://pl.dtsi;subdir=git/arch/${ARCH}/boot/dts"
SRC_URI += "file://zynq-7000.dtsi;subdir=git/arch/${ARCH}/boot/dts"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

PACKAGE_ARCH = "${MACHINE_ARCH}"

