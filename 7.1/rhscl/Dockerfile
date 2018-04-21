FROM centos:7
LABEL maintainer "Bezeklik"

RUN yum --assumeyes install centos-release-scl-rh && \
    yum --assumeyes install rh-php71{,-php{,-{gd,intl,mbstring,mysqlnd,opcache,pear,pecl-apcu,process,xml}}} && \
    yum --assumeyes install centos-release-scl && \
    yum --assumeyes install sclo-php71-php-pecl-{memcached,xdebug} && \
    source scl_source enable rh-php71 && \
    echo -e '#!/bin/bash\nsource scl_source enable rh-php71' > /etc/profile.d/rh-php71.sh && \
    ln -s /etc/{opt/rh/rh-php71/,}php.ini && \
    sed -i 's|;date.timezone =|date.timezone = Asia/Tokyo|' /etc/php.ini && \
    source scl_source enable httpd24 && \
    echo -e '#!/bin/bash\nsource scl_source enable httpd24' > /etc/profile.d/httpd24.sh && \
    ln -s {/opt/rh/httpd24/root,}/etc/httpd && \
    ln -s {/opt/rh/httpd24/root,}/var/www && \
    ln -s /etc/httpd/logs /var/log/httpd && \
    ln -s /usr/lib/systemd/system/{httpd24-,}httpd.service

WORKDIR /var/www/html
EXPOSE 80
CMD ["httpd", "-DFOREGROUND"]
