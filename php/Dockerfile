FROM debian
RUN apt update && apt install -y lsb-release apt-transport-https ca-certificates software-properties-common

RUN apt install wget

RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg 

RUN sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'

# RUN curl -sSL https://packages.sury.org/php/README.txt |  bash -x
RUN apt update && apt install -y php8.2-fpm

RUN apt install -y php8.2-zip php8.2-xml php8.2-curl php8.2-gd php8.2-mysql php8.2-intl php8.2-mbstring
RUN mkdir -p /run/php/
RUN touch /run/php/php8.2-fpm.sock

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"

RUN sudo mv composer.phar /usr/local/bin/composer
RUN apt install -y curl git
RUN curl -sS https://get.symfony.com/cli/installer | bash
RUN mv /root/.symfony5/bin/symfony /usr/local/bin/symfony

RUN git config --global user.email "a22joaquinrs@iessanclemente.net"
RUN git config --global user.name "Joaquin"

WORKDIR /app/symfony

EXPOSE 9000
EXPOSE 8000

#CMD ["/usr/sbin/php-fpm8.2", "-F"] 
CMD ["entrypoint"] 