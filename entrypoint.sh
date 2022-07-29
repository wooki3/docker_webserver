#!/bin/bash
if test -f /first.run; then
yes n | cp -iR /etc/apache2/. /data/config/apache
yes n | cp -iR /var/www/. /data/www/
yes n | cp -iR /etc/php/. /data/config/php
rm /first.run
chown -R www-data:www-data /data/www
#debconf-set-selections <<< "postfix postfix/mailname string admin@brandonsmith.xyz"
debconf-set-selections << "postfix postfix/main_mailer_type string 'Internet Site'"
apt-get install --assume-yes postfix\nelse
cp -fR /data/config/apache/. /etc/apache2
cp -fR /data/config/php/. /etc/php
fi
service apache2 start
service postfix start
