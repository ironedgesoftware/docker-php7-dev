FROM php:7-apache

RUN apt-get update && apt-get install -y git multitail graphviz && pecl install -f xdebug-2.4.0 && \
    echo "zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20151012/xdebug.so" > /usr/local/etc/php/conf.d/xdebug.ini && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin && \
    service apache2 start

WORKDIR /development

CMD ["/bin/bash"]