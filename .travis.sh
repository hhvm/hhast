#!/bin/sh
set -ex
hhvm --version
curl https://getcomposer.org/installer | hhvm -d hhvm.jit=0 --php -- /dev/stdin --install-dir=/usr/local/bin --filename=composer

cd /var/source
hhvm -d hhvm.php7.all=1 /usr/local/bin/composer install

hh_client

hhvm -d hhvm.php7.all=0 vendor/bin/phpunit tests/
hhvm -d hhvm.php7.all=1 vendor/bin/phpunit tests/

hhvm -d hhvm.php7.all=0 bin/hhast-lint --perf
hhvm -d hhvm.php7.all=1 bin/hhast-lint --perf

HHVM_VERSION=$(hhvm --php -r 'echo HHVM_VERSION_ID;' 2>/dev/null);
if [ $HHVM_VERSION -ge 32200 -a $HHVM_VERSION -lt 32300 ]; then
  echo enable_experimental_tc_features = optional_shape_field, unknown_fields_shape_is_not_subtype_of_known_fields_shape >> .hhconfig
  hh_server --check $(pwd)
fi
