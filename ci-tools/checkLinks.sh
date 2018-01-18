#!/bin/bash

REMOTE_LINK_REGEX="^http.*$"
PARSE_AND_PREPARE_LINKS_SCRIPT="parseAndPrepareLinks.js"

function main()
{
  RAW_FILTERED_LINKS=$(grep -o -E '\[([^\[]+)\]\(([^\)]+)\)' **/*.md *.md)

  declare -a CHECK_LOCAL_LINKS
  declare -a CHECK_REMOTE_LINKS

  CLEAN_FILTERED_LINKS=$(node "${PARSE_AND_PREPARE_LINKS_SCRIPT}" "${RAW_FILTERED_LINKS}")

  for link in ${CLEAN_FILTERED_LINKS[@]}; do
    if [[ $link =~ $REMOTE_LINK_REGEX ]]; then
      CHECK_REMOTE_LINKS+=("${link}")
    else
      CHECK_LOCAL_LINKS+=("${link}")
    fi
  done

  FAILED_CHECKS_COUNT=0

  for link in ${CHECK_REMOTE_LINKS[@]}; do
    statusCode=$(curl -s -o /dev/null -w '%{http_code}' "${link}")
    if [[ $statusCode -ne 200 ]]; then
      echo "Error: Link is invalid: '${link}' Status Code: '${statusCode}'"
      FAILED_CHECKS_COUNT=$((FAILED_CHECKS_COUNT + 1))
    fi
  done

  for file in ${CHECK_LOCAL_LINKS[@]}; do
    if [[ ! -a "${file}" ]]; then
      echo "Error: File not found: '${file}'"
      FAILED_CHECKS_COUNT=$((FAILED_CHECKS_COUNT + 1))
    fi
  done

  if [[ $FAILED_CHECKS_COUNT -ne 0 ]]; then
    echo "${FAILED_CHECKS_COUNT} Links are not valid."
    exit 1
  fi

  exit 0
}

main
