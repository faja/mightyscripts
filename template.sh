#!/bin/bash -

set -e
# set -o pipefail
# set -x

# TODO add colors

PROG_VERSION=1.0.0
PROG_NAME=$(basename "${0}")

# {{{ print_help()
print_help() {
  echo "usage:   ${PROG_NAME} ARG1 ARG2 [OPTIONS]"
  echo "example: ${PROG_NAME} arg1 arg2 --bool-flag-example --value-flag-example 0.1.0"
  echo
  echo OPTIONS:
  echo "  --help                  print this message"
  echo "  --verbose               be more verbose (default: false)"
  echo "  --yes                   do not ask for confirmation (default: false)"
  echo "  --bool-flag-example     set something (default: false)"
  echo "  --value-flag-example    set something (default: some_default)"
  echo
  echo "VERSION: ${PROG_VERSION}"
  exit 0
}
# }}}
# {{{ ask_continue()
ask_continue() {
  if test -z "${YES}"; then
    echo -n "continue? CTRL+C to stop, ENTER to continue: "
    read -r
  fi
}
# }}}
# {{{ verbose()
verbose() {
  if test "${VERBOSE}"; then
    echo verbose...
  fi
}
# }}}
# {{{ defaults
BOOL_FLAG_EXAMPLE=
VALUE_FLAG_EXAMPLE=some_default
# }}}
# {{{ option parsing
while test $# -gt 0; do
  case $1 in
    # {{{ help, yes, verbose
    --help)
      print_help
      ;;
    -h)
      print_help
      ;;
    --yes)
      YES=true
      ;;
    --verbose)
      VERBOSE=true
      ;;
    # }}}
    # {{{ options
    --bool-flag-example) # example of bool flag
      BOOL_FLAG_EXAMPLE=true
      ;;
    --value-flag-example)
      VALUE_FLAG_EXAMPLE=${2}
      shift
      ;;
    # }}}
    # {{{ catch all
    -*)
      # catch unknown options but continue
      echo "${PROG_NAME}: $1: unknown option" >&2
      ;;
    *)
      ## case for single ARG
      #: "${ARG1:=${1}}" # take FIRST appearance of any number of args
      # ARG1=${1}        # take LAST appearance of any number of args
      # my preference is
      #: "${ARG1:=${1}}"

      ## case for two ARGs
      if test -z "${ARG1}"; then
        : "${ARG1:=${1}}"
      else
        : "${ARG2:=${1}}" # same rule apply here in terms of take FIRST vs LAST
      fi
      ;;
      # }}}
  esac
  shift
done
# }}}

# check if all arguments were passed
if test -z "${ARG1}" \
  || test -z "${ARG2}"; then
  print_help
fi

verbose
ask_continue

echo
echo processing
echo ARG1: "${ARG1}"
echo ARG2: "${ARG2}"
echo BOOL_FLAG_EXAMPLE: "${BOOL_FLAG_EXAMPLE}"
echo VALUE_FLAG_EXAMPLE: "${VALUE_FLAG_EXAMPLE}"
