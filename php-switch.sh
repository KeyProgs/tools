
#!/usr/bin/env bash
GREEN='\033[0;32m';
YELLOW='\033[0;93m';
NC='\033[0m'; # No Color
if [ -z "$1" ] && [ -z "$2" ] ; then
   echo "No PHP versions provided. Usage: sh ./php-switch <old php version> <new php version>";
   exit;
fi
# Installation of new version
# sudo add-apt-repository ppa:ondrej/php
# sudo apt-get update
# sudo apt-get install php7.1
# sudo apt-get install php7.1-cli php7.1-common php7.1-json php7.1-opcache php7.1-mysql php7.1-mbstring php7.1-zip php7.1-fpm php7.1-intl php7.1-simplexml
sudo a2dismod php$1
sudo a2enmod php$2
sudo service apache2 restart
sudo update-alternatives --set php /usr/bin/php$2
sudo update-alternatives --set phar /usr/bin/phar$2
sudo update-alternatives --set phar.phar /usr/bin/phar.phar$2
sudo update-alternatives --set phpize /usr/bin/phpize$2
sudo update-alternatives --set php-config /usr/bin/php-config$2
