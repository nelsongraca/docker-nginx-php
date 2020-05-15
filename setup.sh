#!/usr/bin/env sh

#s6
apk add --no-cache --purge -uU curl
VERSION=$(curl -SL https://api.github.com/repos/just-containers/s6-overlay/releases/latest | awk '/tag_name/{print $4;exit}' FS='[""]' | sed -e 's_v__')
echo "using s6 version: $VERSION"
curl -o /tmp/s6-overlay-amd64.tar.gz -jkSL https://github.com/just-containers/s6-overlay/releases/download/v${VERSION}/s6-overlay-amd64.tar.gz
tar xzf /tmp/s6-overlay-amd64.tar.gz -C /
apk del --purge curl
rm -rf /var/cache/apk/* /tmp/*

#php and nginx
apk add --no-cache php7-fpm php7-mysqli php7-ctype php7-ldap php7-soap php7-zip php7-bcmath php7-curl php7-exif php7-fileinfo php7-imagick php7-gd php7-json php7-session nginx


