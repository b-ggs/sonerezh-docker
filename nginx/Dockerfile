FROM debian:stable-slim

ENV DEBIAN_FRONTEND noninteractive

# Install what we need
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
	git \
	ffmpeg \
	flac \
	nginx \
	php-fpm \
	php-gd \
	php-zip \
	composer \
	supervisor

# Install Sonerezh
RUN git clone https://github.com/Sonerezh/sonerezh.git /usr/share/nginx/sonerezh && \
	chown -R www-data: /usr/share/nginx/sonerezh && \
	chmod 775 -R /usr/share/nginx/sonerezh
RUN cd /usr/share/nginx/sonerezh && composer install 

# Prepare volume
RUN mkdir /music && \
	ln -s /usr/share/nginx/sonerezh/app/webroot/img/thumbnails /thumbnails && \
	chown www-data: /music

VOLUME /music
VOLUME /thumbnails

# Copy image configuration
RUN rm -f /etc/nginx/sites-enabled/default
COPY default /etc/nginx/sites-enabled/default
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN mkdir /run/php/

EXPOSE 80 
EXPOSE 443

CMD ["/usr/bin/supervisord"]
