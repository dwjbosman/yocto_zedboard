# Install script for directory: /home/dinne/yocto_zedboard/vivado_linux_zynq/vivado_project/vivado_linux_zynq.sdk/mb_bsp/microblaze_0/libsrc/libmetal_v1_4/src/libmetal/lib

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/alloc.h" FILES "/home/dinne/yocto_zedboard/vivado_linux_zynq/vivado_project/vivado_linux_zynq.sdk/mb_bsp/microblaze_0/libsrc/libmetal_v1_4/build_libmetal/lib/include/metal/alloc.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/atomic.h" FILES "/home/dinne/yocto_zedboard/vivado_linux_zynq/vivado_project/vivado_linux_zynq.sdk/mb_bsp/microblaze_0/libsrc/libmetal_v1_4/build_libmetal/lib/include/metal/atomic.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/cache.h" FILES "/home/dinne/yocto_zedboard/vivado_linux_zynq/vivado_project/vivado_linux_zynq.sdk/mb_bsp/microblaze_0/libsrc/libmetal_v1_4/build_libmetal/lib/include/metal/cache.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/compiler.h" FILES "/home/dinne/yocto_zedboard/vivado_linux_zynq/vivado_project/vivado_linux_zynq.sdk/mb_bsp/microblaze_0/libsrc/libmetal_v1_4/build_libmetal/lib/include/metal/compiler.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/condition.h" FILES "/home/dinne/yocto_zedboard/vivado_linux_zynq/vivado_project/vivado_linux_zynq.sdk/mb_bsp/microblaze_0/libsrc/libmetal_v1_4/build_libmetal/lib/include/metal/condition.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/config.h" FILES "/home/dinne/yocto_zedboard/vivado_linux_zynq/vivado_project/vivado_linux_zynq.sdk/mb_bsp/microblaze_0/libsrc/libmetal_v1_4/build_libmetal/lib/include/metal/config.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/cpu.h" FILES "/home/dinne/yocto_zedboard/vivado_linux_zynq/vivado_project/vivado_linux_zynq.sdk/mb_bsp/microblaze_0/libsrc/libmetal_v1_4/build_libmetal/lib/include/metal/cpu.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/device.h" FILES "/home/dinne/yocto_zedboard/vivado_linux_zynq/vivado_project/vivado_linux_zynq.sdk/mb_bsp/microblaze_0/libsrc/libmetal_v1_4/build_libmetal/lib/include/metal/device.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/dma.h" FILES "/home/dinne/yocto_zedboard/vivado_linux_zynq/vivado_project/vivado_linux_zynq.sdk/mb_bsp/microblaze_0/libsrc/libmetal_v1_4/build_libmetal/lib/include/metal/dma.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/io.h" FILES "/home/dinne/yocto_zedboard/vivado_linux_zynq/vivado_project/vivado_linux_zynq.sdk/mb_bsp/microblaze_0/libsrc/libmetal_v1_4/build_libmetal/lib/include/metal/io.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/irq.h" FILES "/home/dinne/yocto_zedboard/vivado_linux_zynq/vivado_project/vivado_linux_zynq.sdk/mb_bsp/microblaze_0/libsrc/libmetal_v1_4/build_libmetal/lib/include/metal/irq.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/list.h" FILES "/home/dinne/yocto_zedboard/vivado_linux_zynq/vivado_project/vivado_linux_zynq.sdk/mb_bsp/microblaze_0/libsrc/libmetal_v1_4/build_libmetal/lib/include/metal/list.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/log.h" FILES "/home/dinne/yocto_zedboard/vivado_linux_zynq/vivado_project/vivado_linux_zynq.sdk/mb_bsp/microblaze_0/libsrc/libmetal_v1_4/build_libmetal/lib/include/metal/log.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/mutex.h" FILES "/home/dinne/yocto_zedboard/vivado_linux_zynq/vivado_project/vivado_linux_zynq.sdk/mb_bsp/microblaze_0/libsrc/libmetal_v1_4/build_libmetal/lib/include/metal/mutex.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/shmem.h" FILES "/home/dinne/yocto_zedboard/vivado_linux_zynq/vivado_project/vivado_linux_zynq.sdk/mb_bsp/microblaze_0/libsrc/libmetal_v1_4/build_libmetal/lib/include/metal/shmem.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/sleep.h" FILES "/home/dinne/yocto_zedboard/vivado_linux_zynq/vivado_project/vivado_linux_zynq.sdk/mb_bsp/microblaze_0/libsrc/libmetal_v1_4/build_libmetal/lib/include/metal/sleep.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/spinlock.h" FILES "/home/dinne/yocto_zedboard/vivado_linux_zynq/vivado_project/vivado_linux_zynq.sdk/mb_bsp/microblaze_0/libsrc/libmetal_v1_4/build_libmetal/lib/include/metal/spinlock.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/sys.h" FILES "/home/dinne/yocto_zedboard/vivado_linux_zynq/vivado_project/vivado_linux_zynq.sdk/mb_bsp/microblaze_0/libsrc/libmetal_v1_4/build_libmetal/lib/include/metal/sys.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/time.h" FILES "/home/dinne/yocto_zedboard/vivado_linux_zynq/vivado_project/vivado_linux_zynq.sdk/mb_bsp/microblaze_0/libsrc/libmetal_v1_4/build_libmetal/lib/include/metal/time.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/utilities.h" FILES "/home/dinne/yocto_zedboard/vivado_linux_zynq/vivado_project/vivado_linux_zynq.sdk/mb_bsp/microblaze_0/libsrc/libmetal_v1_4/build_libmetal/lib/include/metal/utilities.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/version.h" FILES "/home/dinne/yocto_zedboard/vivado_linux_zynq/vivado_project/vivado_linux_zynq.sdk/mb_bsp/microblaze_0/libsrc/libmetal_v1_4/build_libmetal/lib/include/metal/version.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/compiler/gcc/atomic.h" FILES "/home/dinne/yocto_zedboard/vivado_linux_zynq/vivado_project/vivado_linux_zynq.sdk/mb_bsp/microblaze_0/libsrc/libmetal_v1_4/build_libmetal/lib/include/metal/compiler/gcc/atomic.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/compiler/gcc/compiler.h" FILES "/home/dinne/yocto_zedboard/vivado_linux_zynq/vivado_project/vivado_linux_zynq.sdk/mb_bsp/microblaze_0/libsrc/libmetal_v1_4/build_libmetal/lib/include/metal/compiler/gcc/compiler.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/processor/microblaze/atomic.h" FILES "/home/dinne/yocto_zedboard/vivado_linux_zynq/vivado_project/vivado_linux_zynq.sdk/mb_bsp/microblaze_0/libsrc/libmetal_v1_4/build_libmetal/lib/include/metal/processor/microblaze/atomic.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/processor/microblaze/cpu.h" FILES "/home/dinne/yocto_zedboard/vivado_linux_zynq/vivado_project/vivado_linux_zynq.sdk/mb_bsp/microblaze_0/libsrc/libmetal_v1_4/build_libmetal/lib/include/metal/processor/microblaze/cpu.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/system/generic/alloc.h" FILES "/home/dinne/yocto_zedboard/vivado_linux_zynq/vivado_project/vivado_linux_zynq.sdk/mb_bsp/microblaze_0/libsrc/libmetal_v1_4/build_libmetal/lib/include/metal/system/generic/alloc.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/system/generic/condition.h" FILES "/home/dinne/yocto_zedboard/vivado_linux_zynq/vivado_project/vivado_linux_zynq.sdk/mb_bsp/microblaze_0/libsrc/libmetal_v1_4/build_libmetal/lib/include/metal/system/generic/condition.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/system/generic/io.h" FILES "/home/dinne/yocto_zedboard/vivado_linux_zynq/vivado_project/vivado_linux_zynq.sdk/mb_bsp/microblaze_0/libsrc/libmetal_v1_4/build_libmetal/lib/include/metal/system/generic/io.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/system/generic/irq.h" FILES "/home/dinne/yocto_zedboard/vivado_linux_zynq/vivado_project/vivado_linux_zynq.sdk/mb_bsp/microblaze_0/libsrc/libmetal_v1_4/build_libmetal/lib/include/metal/system/generic/irq.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/system/generic/mutex.h" FILES "/home/dinne/yocto_zedboard/vivado_linux_zynq/vivado_project/vivado_linux_zynq.sdk/mb_bsp/microblaze_0/libsrc/libmetal_v1_4/build_libmetal/lib/include/metal/system/generic/mutex.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/system/generic/sys.h" FILES "/home/dinne/yocto_zedboard/vivado_linux_zynq/vivado_project/vivado_linux_zynq.sdk/mb_bsp/microblaze_0/libsrc/libmetal_v1_4/build_libmetal/lib/include/metal/system/generic/sys.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE RENAME "metal/system/generic/microblaze_generic/sys.h" FILES "/home/dinne/yocto_zedboard/vivado_linux_zynq/vivado_project/vivado_linux_zynq.sdk/mb_bsp/microblaze_0/libsrc/libmetal_v1_4/build_libmetal/lib/include/metal/system/generic/microblaze_generic/sys.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/dinne/yocto_zedboard/vivado_linux_zynq/vivado_project/vivado_linux_zynq.sdk/mb_bsp/microblaze_0/libsrc/libmetal_v1_4/build_libmetal/lib/libmetal.a")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/dinne/yocto_zedboard/vivado_linux_zynq/vivado_project/vivado_linux_zynq.sdk/mb_bsp/microblaze_0/libsrc/libmetal_v1_4/build_libmetal/lib/compiler/cmake_install.cmake")
  include("/home/dinne/yocto_zedboard/vivado_linux_zynq/vivado_project/vivado_linux_zynq.sdk/mb_bsp/microblaze_0/libsrc/libmetal_v1_4/build_libmetal/lib/processor/cmake_install.cmake")
  include("/home/dinne/yocto_zedboard/vivado_linux_zynq/vivado_project/vivado_linux_zynq.sdk/mb_bsp/microblaze_0/libsrc/libmetal_v1_4/build_libmetal/lib/system/cmake_install.cmake")

endif()

