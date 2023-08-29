#!/bin/bash -

set -e

PROG_VERSION=1.0.0
PROG_NAME=$(basename "${0}")

# defaults
KIND=${1}    # first arg,  no default
FILE=${2:--} # second arg, default: stdin (`-`)

if test -z "${KIND}" \
  || test -z "${FILE}"; then
  echo "usage:   ${PROG_NAME} RESOURCE_KIND [FILE]"
  echo "example: ${PROG_NAME} Deployment"
  echo
  echo "VERSION: ${PROG_VERSION}"
  exit 0
fi

yq -r --arg kind "${KIND}" '. | select(.kind == $kind) | .metadata.name' "${FILE}"
