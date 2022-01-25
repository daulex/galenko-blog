<?php
// Language support
load_theme_textdomain( 'awave', get_template_directory() . '/languages' );

// All of the base theme functions
require_once(get_template_directory() . '/inc/debug-functions.php');
require_once(get_template_directory() . '/inc/class-awave-theme-setup.php');
// require_once(get_template_directory() . '/inc/class-awave-helper.php');
// require_once(get_template_directory() . '/inc/class-awave-admin.php');
// require_once(get_template_directory() . '/inc/class-awave-gutenberg.php');

// Theme specific functions
require_once(get_template_directory() . '/inc/class-galenko-custom-functions.php');
require_once(get_template_directory() . '/inc/class-galenko-custom-hooks.php');
function register_navwalker(){
    require_once get_template_directory() . '/inc/class-wp-bootstrap-navwalker.php';
}
add_action( 'after_setup_theme', 'register_navwalker' );


$theme_setup = new Awave_Theme_Setup;
$custom_functions = new Galenko_Custom_Functions;


$theme_setup->addNavMenus( array( 
	'primary' => __( 'Primary Menu', 'awave' )
) );

// Styles

if ( file_exists( get_template_directory() . '/dist/css/app.min.css' ) ) :
	$csstime = filemtime( get_template_directory() . '/dist/css/app.min.css' );
	$theme_setup->addStyle( 'app', get_template_directory_uri() . '/dist/css/app.min.css', array(), $csstime );
endif;
if ( file_exists( get_template_directory() . '/dist/css/vendor.min.css' ) ) :
	$csstime = filemtime( get_template_directory() . '/dist/css/vendor.min.css' );
	$theme_setup->addStyle( 'app', get_template_directory_uri() . '/dist/css/vendor.min.css', array(), $csstime );
endif;

// Scripts
if ( file_exists( get_template_directory() . '/assets/vendor/bootstrap.bundle.min.js' ) ) :
    $jstime = filemtime( get_template_directory() . '/assets/vendor/bootstrap.bundle.min.js' );
    $theme_setup->addScript( 'app', get_template_directory_uri() . '/assets/vendor/bootstrap.bundle.min.js', array(), $jstime, true );
endif;
if ( file_exists( get_template_directory() . '/dist/js/app.min.js' ) ) :
	$jstime = filemtime( get_template_directory() . '/dist/js/app.min.js' );
	$theme_setup->addScript( 'app', get_template_directory_uri() . '/dist/js/app.min.js', array(), $jstime, true );
endif;


function new_excerpt_more( $more ) {
    return '...';
}
add_filter('excerpt_more', 'new_excerpt_more');

//$theme_setup->add_theme_support( 'woocommerce' );

define( 'DISALLOW_FILE_EDIT', true );

// Add these to wp config
// define( 'WP_DEBUG', true );
// define( 'WP_DEBUG_DISPLAY', false );
// define( 'WP_DEBUG_LOG', true );