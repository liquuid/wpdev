<?php

define('DB_NAME', 'wordpress');
define('DB_USER', 'ubuntu');
define('DB_PASSWORD', 'mysql');
define('DB_HOST', 'localhost');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

define('AUTH_KEY',         'j!7g@,cf=gQq|zus:bPDZjiEpenY`5M+y27TB2Ef,Fo0$A_<gu@?|GFytb}p3HL4');
define('SECURE_AUTH_KEY',  'nVHpF{,:C30I*A$+U2GTQi;T8O~q89bA;-v0_W-Zn9RUNHxAPIA?O6ve!8O-uzb5');
define('LOGGED_IN_KEY',    ';sRJ:zzJu5?1*.|CJ%+Xd`y&L3>)k5rYaBnh=TLmf7-s*W/%oWr-g&o|yNwI?wt9');
define('NONCE_KEY',        '9K<TZhZ.&b*~=6V9GUj2,mqng]V>QH1%a|/RjdnC~FFc;F/!9(+C@1,0$zdLu<%6');
define('AUTH_SALT',        '2jQ| 4~~xEav/#? !y,_ze;#WB)gY{Op}5y1RMvgoLNEl]NU;Js|gH9cL^I)&.l&');
define('SECURE_AUTH_SALT', '5P[&5|/3f}(cNa{}^^6{3 6jX!HY(K(%@@10<o^w.W<K)_-qbjI{&yM+gI0X$U;C');
define('LOGGED_IN_SALT',   'XAzW$uEM-VZ>}+C[[_YOoDrhqs7JA+$5+I-Q~0hN*{.[upT|?=*!(3NT-ktEG>^_');
define('NONCE_SALT',       '8&q!gm+e3&%__PvFd%kDqt]=a+Jry#v+a{NKej`UUh+u7}[7kP(GTd;}I@v77.H|');

$table_prefix  = 'wp_';
define('WP_DEBUG', false);
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

require_once(ABSPATH . 'wp-settings.php');
