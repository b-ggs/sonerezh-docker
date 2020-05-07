#!/bin/bash
set -e

sed -i "s/define('DOCKER', false)/define('DOCKER', true)/" /usr/share/nginx/sonerezh/app/Config/bootstrap.php

/usr/bin/supervisord -n -c /etc/supervisor/conf.d/supervisord.conf
