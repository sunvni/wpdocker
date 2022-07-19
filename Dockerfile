FROM wordpress:latest

RUN apt update && apt install -y vim --no-install-recommends ssl-cert && \
rm -r /var/lib/apt/lists/* && \
a2enmod ssl && \
a2ensite default-ssl

ENV TZ Asia/Tokyo
RUN echo "${TZ}" > /etc/timezone \
   && dpkg-reconfigure -f noninteractive tzdata

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp \
  && wp --info
