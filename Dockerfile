# https://github.com/docker-library/php/blob/master/7.2/stretch/apache/Dockerfile

FROM centos:7
LABEL maintainer "Bezeklik"

RUN yum --assumeyes install yum-utils && \
    yum --assumeyes install https://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
    yum-config-manager --enable remi --enable remi-php72 && \
    yum --assumeyes install php{,-{gd,intl,mbstring,mysqlnd,opcache,pecl-{apcu,memcached,xdebug},process,xml}}

WORKDIR /var/www/html
EXPOSE 80
CMD ["httpd", "-DFOREGROUND"]
