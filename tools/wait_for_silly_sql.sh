#!/usr/bin/env sh
# wait for it because sql is a bad design choice

set -e

host="$1"
shift

until mysqladmin ping -h"$host" --silent; do
  >&2 echo "Sql not ready yet -- sleeping for 5s"
  sleep 5
done

app="$1"
>&2 echo "Sql is ready -- $app"
exec "$@"
