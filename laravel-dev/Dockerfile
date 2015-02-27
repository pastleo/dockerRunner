# dockerRun: -v $(pwd):/laravel -p 80:80 -it
FROM debian
# FROM debian-bash

RUN apt-get update && apt-get install -y wget less

RUN \
wget http://www.dotdeb.org/dotdeb.gpg -O- | apt-key add -

RUN \
echo "deb http://packages.dotdeb.org wheezy-php56 all" >> /etc/apt/sources.list && \
echo "deb-src http://packages.dotdeb.org wheezy-php56 all" >> /etc/apt/sources.list && \
apt-get update

RUN apt-get -y install \
php5-cli php5-pgsql php5-common php5-mysql php5-imagick php5-imap php5-mcrypt php5-pgsql php5-sqlite php5-gd

RUN apt-get clean

RUN php -r "readfile('http://getcomposer.org/installer');" | \
php -- --install-dir=/usr/local/bin/ --filename=composer

RUN mkdir /laravel

WORKDIR /laravel
ADD artisan-serve.sh /

CMD ["/bin/bash","/artisan-serve.sh"]
# CMD bash
