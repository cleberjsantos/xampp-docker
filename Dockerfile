#vim: set ft=dockerfile:
FROM ubuntu:18.04
LABEL maintainer="Cleber J Santos <cleber@cleberjsantos.com.br>"

ARG XAMPP_VERSION=7.3.11

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    XAMPP_URI=https://downloadsapachefriends.global.ssl.fastly.net/${XAMPP_VERSION}/xampp-linux-x64-${XAMPP_VERSION}-0-installer.run?from_af=true \
    APACHE_PORT=80 \
    APACHE_PORT_SSL=443 \
    MYSQL_PORT=3306

ADD init.sh /usr/local/bin/init.sh

RUN buildDeps="build-essential" \
  && runDeps="wget ca-certificates curl tar net-tools psmisc openssl vim htop bash" \
  && apt-get update \
  && apt-get install -y --no-install-recommends $buildDeps $runDeps \
  && curl -o xampp-linux.run -SL $XAMPP_URI \
  && chmod +x xampp-linux.run \
  && ./xampp-linux.run --mode unattended --unattendedmodeui  minimal \
  && rm ./xampp-linux.run \
  && /opt/lampp/bin/perl -pi -e s'/Require local/Require all granted/g' /opt/lampp/etc/extra/httpd-xampp.conf \
  && mkdir /opt/lampp/apache2/conf.d \
  && echo "IncludeOptional /opt/lampp/apache2/conf.d/*.conf" >> /opt/lampp/etc/httpd.conf \
  && mkdir /www \
  && ln -s /www /opt/lampp/htdocs/ \
  && ln -sf /opt/lampp/lampp /usr/bin/lampp \
  && echo "export PATH=\$PATH:/opt/lampp/bin/" >> /root/.bashrc \
  && chmod 777 /usr/local/bin/init.sh \
  && sed -i -e 's/^root::/root:!:/' /etc/shadow \
  && apt-get purge -y --auto-remove $buildDeps \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE $APACHE_PORT $APACHE_PORT_SSL $MYSQL_PORT

# Start the init script
ENTRYPOINT ["/usr/local/bin/init.sh"]
