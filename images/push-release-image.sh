#!/usr/bin/env bash
set -euo pipefail

if [[ $# -eq 0 ]] ; then
    echo "Syntax: $0 <tag>"
    exit 1
fi
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "${SCRIPT_DIR}"
source "../_variables.source"

TAG=$1
set -x
docker push "${PROJECT_IMAGE_REPOSITORY}/os2display-admin-release:${TAG}"
