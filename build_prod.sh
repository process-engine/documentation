#!/bin/bash

set -e

# {{{ VERSION
MAJOR="1"
MINOR="0"
PATCH="0"

__script_version="$MAJOR.$MINOR.$PATCH"
# }}}

function usage ()
{
# {{{ The Usage Print
  echo "Usage : $0 [options] [argument_list]

    Options:
    -v  Show the version.
    -h  Display this message."
#}}}
}

function on_exit()
{
# {{{
  #Place everything to be cleaned up here.
  return 0
# }}}
}

function build_gitbook()
{
  # build the gitbook
  ./node_modules/.bin/gitbook build
}

function move_index_to_apidoc()
{
  # create the api-docs from the swagger.json and move it to its destination
  npm run render_api_doc

  DOC_SOURCE_FILE='./public/index.html'
  DOC_TARGET_FILE='./andere-themen/cheat-sheet/http-rest-api/apidoc.html'

  mv -f ${DOC_SOURCE_FILE} ${DOC_TARGET_FILE}
}

function move_gitbook_to_docs_folder()
{
  # make the root contain only the built gitbook and nothing else
  GITBOOK_FOLDER='_book'
  DOCS_FOLDER='docs'
  EVERYTHING_TO_DOCS_FOLDER=${GITBOOK_FOLDER}

  mv ${EVERYTHING_TO_DOCS_FOLDER} ${DOCS_FOLDER}

  # Cleanup; TODO: This could be done nicer
  cd ${DOCS_FOLDER} && rm -rf .ci-tools/ .github/ && cd -
  cd ${DOCS_FOLDER} && rm .editorconfig .gitignore Jenkinsfile LICENSE build_prod.sh package.json swagger.json apidoc.md && cd -
}

function cleanup()
{
  rm _book || true
}

#
# Setup the trap.
#
# {{{ trap
trap on_exit INT TERM EXIT
# }}}

function main()
{
# {{{ Main Routine

  # TODO: Add sanity checks; e.g. check for NPM version etc.

  # {{{ Handle Command Line Arguments
  #
  while getopts ":h:" opt
  do
    case $opt in
      h )
        usage
        exit 0
        ;;
      v )
        echo "${__script_version}"
        exit 0
      ;;
    esac
  done
  shift $(($OPTIND-1))
  # }}}

  rm -rf node_modules || true
  rm -rf docs || true
  rm -rf _book || true

  npm install && build_gitbook

  move_gitbook_to_docs_folder

  return 0
# }}}
}

main
