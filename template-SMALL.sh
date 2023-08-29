#!/bin/bash -

set -e
# set -o pipefail
# set -x

PROG_VERSION=1.0.0
PROG_NAME=$(basename "${0}")

# defaults
ARG1=${1}    # first arg, with no default
ARG2=${2:--} # second arg, with a default, usually `FILE`, hence a nice default is stdin (`-`)

if test -z "${ARG1}" \
  || test -z "${ARG2}"; then
  echo "usage:   ${PROG_NAME} ARG1 [ARG2]"
  echo "example: ${PROG_NAME} arg1 arg2"
  echo
  echo "VERSION: ${PROG_VERSION}"
  exit 0
fi

echo "ARG1=${ARG1} ARG2=${ARG2}"
