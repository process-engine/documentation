#!/bin/bash

REMOTE_LINK_REGEX="^http.*$"
PARSE_AND_PREPARE_LINKS_SCRIPT=".ci-tools/parseAndPrepareLinks.js"

function main()
{
  # mailto is a frequent pattern to specify enail adresses;
  # those will not be proper links; we will filter them out
  FILTERED_LINKS_WITHOUT_MAILTO=$(grep -o -E '\[([^\[]+)\]\(([^\)]+)\)' **/*.md *.md | grep -v mailto:)

  declare -a CHECK_LOCAL_LINKS
  declare -a CHECK_REMOTE_LINKS
  declare -a LOCAL_FILES
  declare -a REMOTE_FILES

  CLEAN_FILTERED_LINKS=$(node "${PARSE_AND_PREPARE_LINKS_SCRIPT}" "${FILTERED_LINKS_WITHOUT_MAILTO}")

  # split filtered links into local and remote lists {{{
  for link_and_file in ${CLEAN_FILTERED_LINKS[@]}; do
    #this will appear in the Format: 'filename;link'
    link=${link_and_file#*;}
    file=${link_and_file%;*}

    if [[ $link =~ $REMOTE_LINK_REGEX ]]; then
      CHECK_REMOTE_LINKS+=("${link}")
      REMOTE_FILES+=("${file}")
    else
      CHECK_LOCAL_LINKS+=("${link}")
      LOCAL_FILES+=("${file}")
    fi
  done
  # }}}

  # check remote links for HTTP 200 status code {{{
  FAILED_REMOTE_CHECKS_COUNT=0
  index=0
  for link in ${CHECK_REMOTE_LINKS[@]}; do
    statusCode=$(curl -s -o /dev/null -w '%{http_code}' "${link}")

    # We accept status Codes 200 and 302
    if [[ $statusCode -ne 200 && $statusCode -ne 302 ]]; then
      echo "Error; in file '${REMOTE_FILES[$index]}'; link: '${link}' is invalid; status code: '${statusCode}'"
      FAILED_REMOTE_CHECKS_COUNT=$((FAILED_REMOTE_CHECKS_COUNT + 1))
    fi
    index=$((index + 1))
  done
  # }}}

  index=0
  # check local file links for existence {{{
  FAILED_LOCAL_CHECKS_COUNT=0
  for file in ${CHECK_LOCAL_LINKS[@]}; do
    if [[ ! -a "${file}" ]]; then
      echo "Error; in file '${LOCAL_FILES[$index]}'; file '${file}' not found"
      FAILED_LOCAL_CHECKS_COUNT=$((FAILED_LOCAL_CHECKS_COUNT + 1))
    fi
    index=$((index + 1))
  done
  # }}}

  if [[ $FAILED_REMOTE_CHECKS_COUNT -ne 0 || $FAILED_LOCAL_CHECKS_COUNT -ne 0 ]]; then
    echo "${FAILED_LOCAL_CHECKS_COUNT} Local links are not valid."
    echo "${FAILED_REMOTE_CHECKS_COUNT} Remote links are not valid."
    exit 1
  fi

  exit 0
}

main
