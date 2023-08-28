#!/bin/bash -

# TODO TODO TODO this tool is big todo

#PROG_VERSION=0.1.0
PROG_NAME=$(basename "${0}")

CERT_FILE=${1}
CERT_NUMBER=${2}

if test -z "${CERT_FILE}" \
  || test -z "${CERT_NUMBER}"; then
  echo "${PROG_NAME} CERT_FILE CERT_NUMBER"
  exit 1
fi

awk -v cert_number="${CERT_NUMBER}" '/BEGIN CERT/{p=p+1};{if (p==cert_number) print}' "${CERT_FILE}"
