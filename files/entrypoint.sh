#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace

ulimit -n 8192

if [ "$1" = 'squid' ]; then

	mkdir -p /var/log/squid /var/cache/squid
	chmod -R 755 /var/log/squid
	chown -R squid:squid /var/log/squid /var/cache/squid

	if [[ ! -d /var/cache/squid/00 ]]; then
		echo "Initializing cache..."
		squid -N -f /etc/squid/squid.conf -z
	fi

	echo "starting squid $@"
fi

exec "$@"
