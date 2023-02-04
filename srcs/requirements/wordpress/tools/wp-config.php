<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'docker_db' );

/** Database username */
define( 'DB_USER', 'obelkhad' );

/** Database password */
define( 'DB_PASSWORD', 'obelkhad_passwd' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', 'utf8_general_ci' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'Q7k%7pu0N(DO`=+Ih2#mXwQ&f]nx#hwLaqy90ddws*|?cWsO[d~cZlZN~biFTs h');
define('SECURE_AUTH_KEY',  'hd1,+wbRP%4-FDR-Yxaf/UA]-ZO~mBq/F73qXt/SIv1FWm3)nhn@[c=x:im>m*|(');
define('LOGGED_IN_KEY',    'la6=^H%^;</{m!-,/o^3^3WPJJkz~n77bU8%C|%.nZsZo*m!s8>eEBKV5Jg-;$-*');
define('NONCE_KEY',        '} (nnh{q|]J/^x+).ezawhh|L!B/,4%A!EC_SkE1$|(E5|-5VT`VD=VP!|igCiK9');
define('AUTH_SALT',        'ps0O5C+La=MD) 5CDM-W%3yh1IkXI5#F|s/LUp|makd -kDJqwBT!XlYr=B#ent.');
define('SECURE_AUTH_SALT', 'h<oRo.oH>?Kg#Ne<+P65I.Kz`gb5E|E*roe3okr`}4XW<*1Sks)rV;O6?<MqGdR+');
define('LOGGED_IN_SALT',   '2M@|SH&6+$lx%(3=g$_/*+6~/!&+j@wfDm{|a%PkZ)+jx&>+|c16}Z+03a7DFo=(');
define('NONCE_SALT',       'GE-(suyIUS.GqQ675/Fo{n#^Y&f*.|59|ol|/HMk@4Wn);W(GbF q]CJ+d*mO,Cb');

/**#@-*/

/**
 * WordPress database table prefix.
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
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';