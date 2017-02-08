#!/bin/sh

set -eu

status () {
  echo "---> ${@}" >&2
}

status "starting subversion"
set -x
exec /usr/bin/svnserve -d -r /home/svn --log-file=/var/log/svnserve.log
