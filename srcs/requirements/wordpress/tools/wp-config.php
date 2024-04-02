<?php
/**
 * Configuration de WordPress pour la base de données MariaDB
 */

/** Nom de la base de données de WordPress */
define('DB_NAME', 'wordpress');

/** Nom d'utilisateur de la base de données MySQL */
define('DB_USER', 'wordpress');

/** Mot de passe de la base de données MySQL */
define('DB_PASSWORD', 'wordpress');

/** Nom d'hôte de la base de données MySQL */
define('DB_HOST', 'mariadb');

/** Préfixe de table de la base de données WordPress */
$table_prefix = 'wp_';

/** Clé secrète unique pour la sécurité */
define('AUTH_KEY',         'DR3Rhr&z8#EbP!b7qfaDRi?xEx$FhEqfX496idEQ');
define('SECURE_AUTH_KEY',  '5$S?yoDnSopXhr$HbtT!aM$R8zjMo584HEQAEcDF');
define('LOGGED_IN_KEY',    '6Ba4A545qJ78h#jQNDn?znYMoa@xM4TGyE@RQ@$6');
define('NONCE_KEY',        'oG@p3a7!aeT6iEnEt79eet5jp!Pq5rc$E&@f8A7a');
define('AUTH_SALT',        'aB&izSR#tiA&b6d&AgDzt$Jr5g!?5Q#AP8zdik$r');
define('SECURE_AUTH_SALT', '6Bq&HcP8T6cfJL!a!&Db#kay6@GgM6ytNxefbJ3K');
define('LOGGED_IN_SALT',   'qqgq3FipXDn8iQY6qiJaLNzER69Kfc8$!qbE&tfg');
define('NONCE_SALT',       'FD5$4Rde@sD6o@SRBfghaeeY?mc3cn@D8dX3M?Rk');

/** Chemin absolu vers le répertoire WordPress */
if ( !defined('ABSPATH') )
        define('ABSPATH', '/var/www/html/wordpress');

/** Réglages des développeurs : Afficher tous les erreurs de WordPress */
define('WP_DEBUG', false);

/** Désactiver les mises à jour automatiques */
define('WP_AUTO_UPDATE_CORE', false);

/** Désactiver l'installation de thèmes et de plugins depuis l'interface d'administration */
define('DISALLOW_FILE_MODS', true);

require_once(ABSPATH . 'wp-settings.php');