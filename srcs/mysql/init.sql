CREATE DATABASE wordpress;
GRANT ALL PRIVILEGES ON wordpress.* to 'wp_admin'@'%' IDENTIFIED BY 'admin';

FLUSH PRIVILEGES;

USE wordpress;