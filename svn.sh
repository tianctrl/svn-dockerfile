#!/bin/sh

set -eu

status () {
  echo "---> ${@}" >&2
}

status "starting subversion"
set -x
exec /usr/bin/svnserve -d --foreground -r /home/svn --log-file=/var/log/svnserve.log && tail -f /var/log/svnserve.log
