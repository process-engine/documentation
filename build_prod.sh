#!/bin/bash

set -e

# {{{ VERSION
MAJOR="0"
MINOR="0"
PATCH="3"

__script_version="$MAJOR.$MINOR.$PATCH"
# }}}

# {{{ Global Variables
GIT_SOURCE_BRANCH='develop'
GIT_TARGET_BRANCH='gh-pages-test'
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
  #Place everything that absolutely need to be cleaned up here.
  return 0
# }}}
}

function prepare_git()
{
  # make the gh-pages-branch be identical to develop
  git checkout ${GIT_TARGET_BRANCH}
  git pull
  git checkout ${GIT_SOURCE_BRANCH}
  git pull
  git merge --strategy=ours ${GIT_TARGET_BRANCH}
  git checkout ${GIT_TARGET_BRANCH}
  git merge ${GIT_SOURCE_BRANCH}
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

function move_gitbook_to_root()
{
  # make the root contain only the built gitbook and nothing else
  TEMP_DIR=$(mktemp -d)
  GITBOOK_FOLDER='_book'
  EVERYTHING_FROM_GITBOOK_FOLDER="${TEMP_DIR}/${GITBOOK_FOLDER}/*"

  mv * ${TEMP_DIR}
  mv ${EVERYTHING_FROM_GITBOOK_FOLDER} ./
}

function cleanup()
{
  rm -rf $TEMP_DIR
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

  prepare_git

  npm install

  build_gitbook

  move_gitbook_to_root

  return 0
# }}}
}

main
