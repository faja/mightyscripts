#!/bin/bash -

PROG_VERSION=0.1.0
PROG_NAME=$(basename "${0}")

# {{{ print_help()
print_help() {
  echo "usage:   ${PROG_NAME} [SUBCOMMAND] [OPTIONS]"
  echo "example: ${PROG_NAME} get_cert_info --file - --cert-no 2"
  echo
  echo SUBCOMMANDS:
  echo "  get_cert        print cert (default subcommand)"
  echo "  get_cert_info   print cert details"
  echo
  echo OPTIONS:
  echo "  --help|-h      print this message"
  echo "  --file|-f      file to read certs from (default: stdin)"
  echo "  --cert-no|-c   cert number to display (default: 1)"
  echo
  echo "VERSION: ${PROG_VERSION}"
  exit 0
}
# }}}

# {{{ defaults
SUBCOMMAND=get_cert
CERT_FILE=-
CERT_NUMBER=1
# }}}
#
# {{{ option parsing
while test "${#}" -gt 0; do
  case "${1}" in
    # {{{ help
    --help)
      print_help
      ;;
    -h)
      print_help
      ;;
    # }}}
    # {{{ options
    --file)
      CERT_FILE="${2}"
      shift
      ;;
    -f)
      CERT_FILE="${2}"
      shift
      ;;
    --cert-no)
      CERT_NUMBER="${2}"
      shift
      ;;
    -c)
      CERT_NUMBER="${2}"
      shift
      ;;
    # }}}
    # {{{ catch all
    -*)
      # catch unknown options but continue
      echo "${PROG_NAME}: $1: unknown option" >&2
      ;;
    *)
      SUBCOMMAND=${1}
      ;;
      # }}}
  esac
  shift
done
# }}}

if test "${SUBCOMMAND}" != "get_cert" \
  && test "${SUBCOMMAND}" != "get_cert_info"; then
  print_help
fi

if test "${SUBCOMMAND}" == "get_cert"; then
  awk -v cert_number="${CERT_NUMBER}" '/BEGIN CERT/{p=p+1};{if (p==cert_number) print}' "${CERT_FILE}"
fi

if test "${SUBCOMMAND}" == "get_cert_info"; then
  openssl x509 -noout -text -in <(certTool.sh get_cert --file "${CERT_FILE}" --cert-no "${CERT_NUMBER}")
fi
