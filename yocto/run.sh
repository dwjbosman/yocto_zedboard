#!/usr/bin/env bash

# this scripts start the container and dynamically creates a user corresponding to the host user and will mount his/hers home dir

USER_UID=$(id -u $USER)
USER_GID=$(id -g $USER)
		
SOURCE_IMAGE=yocto_xilinx

CONTAINER_NAME="${SOURCE_IMAGE}-${USER}"

CID=$(docker ps -q -f status=running -f name=^/${CONTAINER_NAME}$)

CMD_IN_CONTAINER=(/bin/bash)

if [ ! "${CID}" ]; then

     docker run -td \
        -e DISPLAY=$$DISPLAY \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -v /home/$USER:/home/$USER \
        --name "${CONTAINER_NAME}" \
        "${SOURCE_IMAGE}" \
        /bin/bash

      # Add the current user to the container
      docker exec \
          -ti \
          ${CONTAINER_NAME} \
          /bin/bash -c "addgroup --gid $USER_GID $USER >/dev/null 2>&1 && adduser --no-create-home --disabled-password --gecos \"\" --uid $USER_UID --gid $USER_GID $USER >/dev/null 2>&1 && usermod -a -G sudo $USER"

      echo "created container"
fi

CID=$(docker ps -q -f status=running -f name=^/${CONTAINER_NAME}$)

echo "logging into container"
docker exec -ti ${CID} ${CMD_IN_CONTAINER[@]}


 
