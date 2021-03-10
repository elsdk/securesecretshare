#!/usr/bin/env sh
memcached -u yopass --daemon
redis-server --daemonize yes
cd /
if [ "${PORT}" == "" ]
then {
    PORT=1337
}
fi
./yopass-server --port ${PORT}
