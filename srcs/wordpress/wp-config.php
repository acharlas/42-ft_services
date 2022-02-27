<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'wp_admin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'admin' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '%I+Dd<H%551g}[Fg}4zy2u#;|/+>Pe1mLb$YGI9zcEZ&4H}vwIQ;/)iBdVI=~)QZ' );
define( 'SECURE_AUTH_KEY',  'H-mUz5Hg_N*z4n^Wl0T!064pqvfp=d[d%tbOCXHoXIu8 D[1I;<f#J+f%t99MAxK' );
define( 'LOGGED_IN_KEY',    'yu:F.1nKTrP]Syb+N|b,#}C*qC8=b~shft%3e*?N)V/Z;GzA(i:8Kla:3QI,+,XG' );
define( 'NONCE_KEY',        'R=Ju[@_p47+sFf&5j%KX@NKW,Z$e^O[xt}7U9za@OWvWwW9|u6:7}ykn/8OLap$f' );
define( 'AUTH_SALT',        'M*BI#UJH@W3Mp1q9]u1 6:<F|G<^%y]|*Cmf/*sY|(OJs3TYKG%}aJ7&q#=k8fyp' );
define( 'SECURE_AUTH_SALT', '&(C5tc0C>w67<%I71 GP7QK&b $Na]Rdv8m|[b*_seib)1>{aiA|{]7~XB@Nc*9h' );
define( 'LOGGED_IN_SALT',   '|8u@d$afwdKOzUR%K47N-lfBo2XdbO^!-]U**~<wjaLpd)a-9#R<q>,@rP.kXW:l' );
define( 'NONCE_SALT',       'Xe`;L6pw-y&c^V0:Sm+!/(.?gypzqStrLEVF{?UgP],$CnC1/31N4>,YvCnPDu&-' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', true );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
