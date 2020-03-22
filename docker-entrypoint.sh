#!/bin/bash
set -e

render keystone.conf.template -o /etc/keystone/keystone.conf
render logging.conf.template -o /etc/keystone/logging.conf
render apache2.conf.template -o /etc/apache2/apache2.conf

exec "$@"
