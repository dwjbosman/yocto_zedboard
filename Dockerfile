FROM ubuntu:18.04
RUN apt-get -qq update && \
    apt-get -q -y upgrade && \
    apt-get install -y sudo curl wget locales git vim screen libncurses5-dev pkg-config gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential chrpath socat cpio python python3 python-pip libsdl1.2-dev sudo && \
    rm -rf /var/lib/apt/lists/*

RUN groupadd dinne --gid 1000
RUN useradd dinne --uid 1000 --gid 1000
RUN mkdir /home/dinne && chown dinne:dinne -R /home/dinne
RUN mkdir /yocto && chown dinne:dinne -R /yocto

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
#    mkdir -p /home/developer && \
#    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
#    echo "developer:x:${uid}:" >> /etc/group && \
    echo "dinne ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/dinne && \
    chmod 0440 /etc/sudoers.d/dinne 
#&& \
#    chown ${uid}:${gid} -R /home/dinne

RUN locale-gen en_US.UTF-8

USER dinne
RUN echo "defshell -bash" > /home/dinne/.screenrc

ENV HOME /home/dinne
# Ensure that we always use UTF-8 and with Canadian English locale
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

RUN cd /yocto && git clone git://git.yoctoproject.org/poky
#RUN cd /yocto/poky && git checkout morty
RUN cd /yocto/poky && git checkout sumo
#RUN cd /yocto/poky/ && git clone  https://github.com/Xilinx/meta-xilinx.git 
#RUN cd /yocto/poky/meta-xilinx && git checkout morty
RUN cd /yocto/poky/ && git clone -b sumo https://github.com/Xilinx/meta-xilinx.git
SHELL ["/bin/bash", "-c"]
RUN cd /yocto/poky && source oe-init-build-env && bitbake-layers add-layer "/yocto/poky/meta-xilinx/meta-xilinx-bsp"
RUN cd /yocto/poky && echo "MACHINE ??= \"zedboard-zynq7\"" >> build/conf/local.conf

#RUN cd /yocto/poky && source oe-init-build-env && bitbake core-image-minimal --runall fetch
RUN cd /yocto/poky && source oe-init-build-env && bitbake core-image-minimal

#ADD meta-dinne /yocto/poky/meta-dinne
#RUN sudo chown dinne:dinne -R /yocto/poky/meta-dinne
#RUN cd /yocto/poky && source oe-init-build-env && bitbake-layers add-layer "/yocto/poky/meta-dinne"

ADD meta-dts /yocto/poky/meta-dts
RUN sudo chown dinne:dinne -R /yocto/poky/meta-dts
RUN cd /yocto/poky && source oe-init-build-env && bitbake-layers add-layer "/yocto/poky/meta-dts"
#need to remove repodata dir, otherwise we'll get a mv error (the target dir is not empty...)
RUN rm -rf /yocto/poky/build/tmp/work/zedboard_zynq7-poky-linux-gnueabi/core-image-minimal/1.0-r0/oe-rootfs-repo/repodata && cd /yocto/poky && source oe-init-build-env && bitbake core-image-minimal 
#RUN cd /yocto/poky && source oe-init-build-env && bitbake linux-xlnx


#RUN cd /yocto/poky && source oe-init-build-env && yocto-bsp create meta-dinne arm
#RUN cd /yocto/poky/meta-xilinx && git checkout master && git checkout sumo

#RUN export DEBIAN_FRONTEND=noninteractive && apt-get install -yq  nvidia-410 lightdm-
#RUN cd /darknet/darknet && ./darknet detect cfg/yolov3.cfg yolov3.weights data/dog.jpg
#RUN cd /usr/local/cuda/samples/0_Simple/vectorAdd  && make && ./vectorAdd

