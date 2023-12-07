# Use Debian Bullseye as the base image
FROM debian:bullseye

# Update the package repository and install necessary packages
RUN apt-get update && apt-get install -y \
    apache2 \
    php \
    php-mysql \
    php-curl \
    php-gd \
    php-mbstring \
    php-xml \
    libapache2-mod-php \
    wget \
    unzip

# Download and extract WordPress
RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzvf latest.tar.gz -C /var/www/html --strip-components=1 && \
    rm latest.tar.gz

# Configure Apache
RUN a2enmod rewrite
RUN    service apache2 restart
RUN    rm /etc/apache2/sites-available/000-default.conf
RUN    chown -R www-data:www-data /var/www/html

# Copy custom Apache configuration
COPY /conf/apache-config.conf /etc/apache2/sites-available/000-default.conf

# Enable module rewrite
RUN a2enmod rewrite
# Restart Apache to apply the new configuration
CMD ["apache2ctl", "-D", "FOREGROUND"]


