#!/bin/sh
set -ex
hhvm --version
apt-get update -y
apt-get install -y wget curl git
curl https://getcomposer.org/installer | hhvm -d hhvm.jit=0 --php -- /dev/stdin --install-dir=/usr/local/bin --filename=composer

cd /var/source
hhvm -d hhvm.php7.all=1 /usr/local/bin/composer install

hh_server --check $(pwd)
hhvm -d hhvm.php7.all=0 vendor/bin/phpunit tests/
hhvm -d hhvm.php7.all=1 vendor/bin/phpunit tests/

hhvm -d hhvm.php7.all=0 bin/hhast-lint -vv --perf
hhvm -d hhvm.php7.all=1 bin/hhast-lint -vv --perf
