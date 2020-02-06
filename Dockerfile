FROM debian:10
RUN set -eux && \
    apt update && \
        apt -y install ca-certificates apt-transport-https apache2 default-mysql-server wget gnupg php php-mysql libapache2-mod-php && \
        wget https://wordpress.org/latest.tar.gz && \
        tar -xvf latest.tar.gz -C /var/www/html/ && \
        rm latest.tar.gz && chown -R www-data:www-data /var/www/html/wordpress && \
        service apache2 start && \
        a2enmod rewrite && a2dismod status &&\
        apt-get clean && rm -rf /var/lib/apt/lists
EXPOSE 80

ENTRYPOINT [ "/usr/sbin/apachectl", "-D", "FOREGROUND" ]
