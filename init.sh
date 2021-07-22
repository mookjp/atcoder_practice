#!/bin/bash -e

if [ $# -eq 0 ]; then
    echo "usage: init.sh {module name} {new directory name}"
    echo "e.g. github.com/mookjp/atcoder 044"
    exit 1
fi

if [ -d $2 ]; then
    echo "$1 already exists"
    exit 1
fi

BASEDIR=$(/bin/pwd)

for q in {a..f}; do
  QUESTION_DIR="$2/$q"
  mkdir -p "${QUESTION_DIR}"
  cp -r "${BASEDIR}/templates/question/" "${QUESTION_DIR}"
  cd "${QUESTION_DIR}" || exit 1
  go mod init "${1}/${QUESTION_DIR}"
  cd "${BASEDIR}" || exit 1
done
