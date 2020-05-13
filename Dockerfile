FROM alpine:3.11

ADD setup.sh /setup.sh
RUN chmod +x /setup.sh && /setup.sh

ADD php-fpm /etc/services.d/php-fpm
ADD php.ini /etc/php7/php.ini
ADD www.conf /etc/php7/php-fpm.d/www.conf

ADD nginx-config /etc/cont-init.d/00-configure-nginx
ADD site.conf /etc/nginx/conf.d/site.conf

EXPOSE 80

VOLUME /var/www

ENTRYPOINT ["/init"]

CMD ["nginx", "-g", "daemon off;"]
