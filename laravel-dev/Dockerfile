# dockerRun: -v $(pwd):/workspace -p 80:80 -it
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
php5-cli php5-common php5-imap php5-gd php5-curl php5-fpm php5-imagick php5-mcrypt php5-pgsql php5-mysql php5-sqlite php5-gd

RUN apt-get clean

RUN php -r "readfile('http://getcomposer.org/installer');" | \
php -- --install-dir=/usr/local/bin/ --filename=composer

RUN mkdir /workspace

WORKDIR /workspace
ADD artisan-serve.sh /

CMD ["/bin/bash","/artisan-serve.sh"]
# CMD bash
