# dockerRun: -v $(pwd):/htdoc -p 80:80 -p 3306:3306 -it
FROM debian

RUN apt-get update && apt-get install -y wget less

RUN \
wget http://www.dotdeb.org/dotdeb.gpg -O- | apt-key add - && \
wget http://nginx.org/keys/nginx_signing.key -O- | apt-key add -

RUN \
echo "deb http://packages.dotdeb.org wheezy-php56 all" >> /etc/apt/sources.list && \
echo "deb-src http://packages.dotdeb.org wheezy-php56 all" >> /etc/apt/sources.list && \
echo "deb http://nginx.org/packages/debian/ wheezy nginx" >> /etc/apt/sources.list && \
echo "deb-src http://nginx.org/packages/debian/ wheezy nginx" >> /etc/apt/sources.list && \
apt-get update

RUN apt-get -y install mysql-server \
php5-fpm php5-mysql php5-imagick php5-imap php5-mcrypt php5-pgsql php5-sqlite php5-gd \
nginx

RUN apt-get clean

RUN rm -fr /etc/nginx
ADD nginx /etc/nginx

RUN mkdir -p /htdoc /root

RUN \
sed -i -E "s/^ *;? *access.log *=.*$/access.log = \/root\/server.log/g" /etc/php5/fpm/pool.d/www.conf && \
sed -i -E "s/^ *;? *listen *=.*$/listen = \/var\/run\/php5-fpm.sock/g" /etc/php5/fpm/pool.d/www.conf

RUN \
sed -i -E "s/^ *;? *date.timezone *=.*$/date\.timezone = Asia\/Taipei/g" /etc/php5/fpm/php.ini

ADD start_lnmp.sh /root/

RUN chmod u+x /root/start_lnmp.sh

EXPOSE 80

CMD ["/root/start_lnmp.sh"]
# CMD bash
