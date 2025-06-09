#!/usr/bin/env bash
set -euo pipefail
set -x

# defaults if no args supplied
IMAGE_NAME="${1:-myizpbxdebianimage}"
CONTAINER_NAME="${2:-myIzPbxDebainContainer}"

# 1) Stop running container (exact‐name match)
if [[ -n "$(docker ps -q -f name="^${CONTAINER_NAME}$")" ]]; then
  echo "Stopping container ${CONTAINER_NAME}…"
  docker stop "${CONTAINER_NAME}"
fi

# 2) Remove container (any state)
if [[ -n "$(docker ps -aq -f name="^${CONTAINER_NAME}$")" ]]; then
  echo "Removing container ${CONTAINER_NAME}…"
  docker rm "${CONTAINER_NAME}"
fi

# 3) Remove image if it exists
if [[ -n "$(docker images -q "${IMAGE_NAME}")" ]]; then
  echo "Removing image ${IMAGE_NAME}…"
  docker rmi "${IMAGE_NAME}"
fi

# 4) Rebuild and run
docker build -t "${IMAGE_NAME}" .
docker run --name "${CONTAINER_NAME}" "${IMAGE_NAME}"


docker container ls
