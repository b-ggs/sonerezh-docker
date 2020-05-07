FROM debian:stable-slim

ENV DEBIAN_FRONTEND noninteractive

# Install what we need
RUN apt update && apt upgrade -y && apt install -y \
	git \
	libav-tools \
	ffmpeg \
	flac \
	nginx \
	php7-fpm \
	php7-gd \
	php7-mysql \
	supervisor

# Install Sonerezh
RUN git clone https://github.com/Sonerezh/sonerezh.git /usr/share/nginx/sonerezh && \
	chown -R www-data: /usr/share/nginx/sonerezh && \
	chmod 775 -R /usr/share/nginx/sonerezh

# Prepare volume
RUN mkdir /music && \
	ln -s /usr/share/nginx/sonerezh/app/webroot/img/thumbnails /thumbnails && \
	chown www-data: /music

VOLUME /music
VOLUME /thumbnails

# Copy image configuration
RUN rm -f /etc/nginx/sites-enabled/default
COPY default /etc/nginx/sites-enabled/default
COPY supervisord.conf etc/supervisor/conf.d/supervisord.conf
COPY docker-entrypoint.sh /entrypoint.sh

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/supervisord"]
