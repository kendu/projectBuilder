#
#       .
#        ":"
#      ___:____     |"\/"|
#    ,'        `.    \  /
#    |  O        \___/  |¸
#  ~^~^~^~^~^~^~^~^~^~^~^~^~
#Project builder container by kendu
FROM ubuntu
MAINTAINER DevOps <devops@kendu.si>
USER root
RUN locale-gen sl_SI.UTF-8
ENV DEBIAN_FRONTEND noninteractive

# Ondřej Surý's PHP 5.6 packages
RUN echo "deb http://ppa.launchpad.net/ondrej/php5-5.6/ubuntu trusty main " \
       > /etc/apt/sources.list.d/ondrej.list ; \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E5267A6C

RUN apt-get update
RUN apt-get install -q -y \
        git \
        curl \
        wget \
        make


RUN apt-get install -q -y \
        php5 \
        php5-cli \
        php5-curl \
        php5-xdebug \
        php5-mcrypt \
        php5-gmp \
        php5-imagick \
        php5-intl \
        php5-json \
        php5-memcache \
        php5-pgsql \
        php5-readline \
        php5-sqlite \
        ruby-full

# Node.js official repo & update NPM to latest
RUN curl -sL https://deb.nodesource.com/setup | bash - && \
    apt-get install -y nodejs && \
    npm install -g npm

RUN npm install -g \
        bower \
        grunt \
        grunt-autoprefixer \
        grunt-cli \
        grunt-contrib-concat \
        grunt-contrib-jshint \
        grunt-contrib-sass \
        grunt-contrib-uglify \
        grunt-contrib-watch \
        grunt-modernizr \
        grunt-version \
        grunt-wp-assets \
        gulp \
        gulp-concat \
        gulp-continuous-concat \
        gulp-csslint \
        gulp-jshint \
        gulp-minify-css \
        gulp-sass \
        gulp-uglify \
        gulp-watch \
        load-grunt-tasks \
        time-grunt \
        raml2html

RUN apt-get clean

RUN gem install compass
RUN php5enmod php5-mcrypt


RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer
