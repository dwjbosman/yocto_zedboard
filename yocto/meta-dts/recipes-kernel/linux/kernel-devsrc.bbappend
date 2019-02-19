RDEPENDS_${PN} += " python flex bison ${TCLIBC}-utils"
# 4.15+ needs these next two RDEPENDS
RDEPENDS_${PN} += " openssl-dev util-linux"
# and x86 needs a bit more for 4.15+
RDEPENDS_${PN} += " ${@bb.utils.contains('ARCH', 'x86', 'elfutils', '', d)}"
