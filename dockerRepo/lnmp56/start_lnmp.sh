#!/bin/sh

echo "=================== starting Mysql deamon... ===================" >> /root/server.log
service mysql start >> /root/server.log
service mysql status >> /root/server.log

echo " =================== starting php-fpm... ===================" >> /root/server.log
php5-fpm -v >> /root/server.log
php5-fpm >> /root/server.log
service php5-fpm status >> /root/server.log

echo "===================starting nginx...===================" >> /root/server.log
nginx -t >> /root/server.log
nginx >> /root/server.log
service nginx status >> /root/server.log

echo "LNMP has started Ctrl-C and press q to stop" >> /root/server.log
less +F /root/server.log

echo "\n===================\nstopping php-fpm...\n==================="
service php5-fpm stop

echo "\n===================\nstoping nginx...\n==================="
service nginx stop

echo "\n===================\nstoping Mysql deamon...\n==================="
service mysql stop

