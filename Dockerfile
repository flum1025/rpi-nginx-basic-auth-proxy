FROM tobi312/rpi-nginx

MAINTAINER flum1025 <flum.1025@gmail.com>

RUN useradd --no-create-home nginx

# install .htpasswd
RUN apt-get update && apt-get install -y apache2-utils && apt-get clean

ADD etc/nginx/ /etc/nginx/
ADD opt/local/bin/prepare /opt/local/bin/

CMD ["sh", "-c", "/opt/local/bin/prepare && nginx -g 'daemon off;'"]
