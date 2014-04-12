#! /bin/bash

### BEGIN INIT INFO
# Provides:          unicorn
# Required-Start:    $local_fs $remote_fs $network $syslog
# Required-Stop:     $local_fs $remote_fs $network $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: starts the unicorn web server
# Description:       starts unicorn
### END INIT INFO

USER="claudia"
APP_ROOT="/var/www/holoteca"
DAEMON_OPTS="-c $APP_ROOT/current/config/unicorn.rb -E staging -D"
DESC="Unicorn app for $USER"
PID="$APP_ROOT/shared/pids/unicorn.holoteca.pid"

case "$1" in
  start)
    CD_TO_APP_DIR="cd $APP_ROOT/current"
    START_DAEMON_PROCESS="bundle exec unicorn $DAEMON_OPTS"

    echo -n "Starting $DESC: "
    if [ `whoami` = root ]; then
      su - $USER -c "$CD_TO_APP_DIR > /dev/null 2>&1 && $START_DAEMON_PROCESS"
    else
      $CD_TO_APP_DIR > /dev/null 2>&1 && $START_DAEMON_PROCESS
    fi
    echo "Ok"
    ;;
  stop)
    echo -n "Stopping $DESC: "
    kill -QUIT `cat $PID`
    echo "Ok"
    ;;
  restart)
    echo -n "Restarting $DESC: "
    kill -USR2 `cat $PID`
    echo "Ok"
    ;;
  reload)
    echo -n "Reloading $DESC configuration: "
    kill -HUP `cat $PID`
    echo "Ok"
    ;;
  *)
    echo "Usage: unicorn {start|stop|restart|reload}" >&2
    exit 1
    ;;
esac

exit 0