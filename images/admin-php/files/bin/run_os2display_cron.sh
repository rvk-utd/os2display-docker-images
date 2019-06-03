#!/usr/bin/env bash
set -euo pipefail

if [[ -z "${APP_ENV}:" ]] ; then
  if [[ $# -eq 0 ]] ; then
      echo "Syntax: $0 <environment>"
      exit 1
  else
    APP_ENV=$1
  fi
fi

cd /var/www/admin
echo "running in $APP_ENV"

# The location of console changes between admin-releases - support both.
if [[ -x app/console ]]; then
  CONSOLE="app/console"
elif [[ -x bin/console ]]; then
  CONSOLE="bin/console"
else
  echo "Could not find console"
  exit 1
fi

# We pipe stderr to stdout as jobber won't log stderr.
APP_ENV=${APP_ENV} gosu www-data $CONSOLE os2display:core:cron 2>&1
