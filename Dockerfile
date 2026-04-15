FROM php:7.4-apache

# 安装基础依赖
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev libzip-dev \
    libicu-dev libxml2-dev libonig-dev unzip curl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) mysqli pdo_mysql gd zip intl soap bcmath calendar mbstring

# 使用 ARG 获取构建平台架构 (amd64 或 arm64)
ARG TARGETARCH

# 根据架构动态下载 ionCube
RUN if [ "$TARGETARCH" = "arm64" ]; then \
        IONCUBE_LINK="https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_aarch64.tar.gz"; \
    else \
        IONCUBE_LINK="https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz"; \
    fi \
    && curl -fsSL $IONCUBE_LINK -o ioncube.tar.gz \
    && tar -xzf ioncube.tar.gz \
    && cp ioncube/ioncube_loader_lin_7.4.so $(php -r "echo ini_get('extension_dir');") \
    && rm -rf ioncube.tar.gz ioncube \
    && echo "zend_extension=ioncube_loader_lin_7.4.so" > /usr/local/etc/php/conf.d/00-ioncube.ini

RUN a2enmod rewrite
WORKDIR /var/www/html
RUN chown -R www-data:www-data /var/www/html
