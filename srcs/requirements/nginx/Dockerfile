FROM debian:bullseye

RUN apt-get -y update
RUN    apt-get -y install nginx
RUN apt-get -y install openssl


RUN mkdir /etc/nginx/ssl
RUN mkdir -p /run/nginx

RUN openssl req -x509 -nodes \
        -out /etc/nginx/ssl/inception.crt \
        -keyout /etc/nginx/ssl/inception.key \
        -subj "/C=FR/ST=IDF/L=Paris/0=42/OU=42/CN=maujogue.42.fr/UID=maujogue"

COPY /conf/nginx.conf /etc/nginx/sites-available/default

EXPOSE 5000/tcp

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]