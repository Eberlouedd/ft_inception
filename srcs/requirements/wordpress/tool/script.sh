#!/bin/bash

cd /var/www/wordpress/

if [ -f ./wp-config.php ]
then
	echo "Wordpress already installed"
else
	sleep 10 
	wp config create	--allow-root --path='/var/www/wordpress'\
				--dbname=${SQL_DATABASE} \
				--dbuser=${SQL_USER} \
				--dbpass=${SQL_PASSWORD} \
				--dbhost=${SQL_HOST};

	wp core install	--allow-root --path='/var/www/wordpress'\
				--url=https://${DOMAIN_NAME} \
				--title=${SITE_TITLE} \
				--admin_user=${ADMIN_USER} \
				--admin_password=${ADMIN_PASSWORD} \
				--admin_email=${ADMIN_EMAIL};

	wp user create --allow-root --path='/var/www/wordpress'\
				${USER_LOGIN} ${USER_EMAIL} \
				--role=author \
				--user_pass=${USER_PASS};

	wp cache flush --allow-root

fi

exec /usr/sbin/php-fpm7.3 -F -R