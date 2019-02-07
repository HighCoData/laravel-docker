FROM lorisleiva/laravel-docker

# Install dev dependencies
RUN apk add --no-cache --virtual .build-deps \
    $PHPIZE_DEPS \
    curl-dev \
    imagemagick-dev \
    libtool \
    libxml2-dev \
    postgresql-dev \
    sqlite-dev

#install PECL and PEAR extensions
RUN pecl install ast

# Install and enable php extensions
RUN docker-php-ext-enable ast

# Cleanup dev dependencies
RUN apk del -f .build-deps

RUN rm -rf /var/cache/apk/*

WORKDIR /var/www
