<?php
// Language support
load_theme_textdomain( 'awave', get_template_directory() . '/languages' );

// All of the base theme functions
require_once(get_template_directory() . '/inc/debug-functions.php');
require_once(get_template_directory() . '/inc/class-awave-theme-setup.php');
require_once(get_template_directory() . '/inc/class-awave-helper.php');
require_once(get_template_directory() . '/inc/class-awave-admin.php');
require_once(get_template_directory() . '/inc/class-awave-gutenberg.php');

// Theme specific functions
require_once(get_template_directory() . '/inc/class-galenko-custom-functions.php');
require_once(get_template_directory() . '/inc/class-galenko-custom-hooks.php');

require_once(get_template_directory() . '/inc/rest/like.php');
require_once(get_template_directory() . '/inc/rest/pageview.php');

$theme_setup = new Awave_Theme_Setup;
$custom_functions = new galenko_Custom_Functions;

$theme_setup->addNavMenus( array( 
	'primary' => __( 'Primary Menu', 'awave' )
) );

//$theme_setup->add_theme_support( 'woocommerce' );

// Styles and scripts
add_action( 'wp_enqueue_scripts', function() {

	// App style
	if ( file_exists( get_template_directory() . '/dist/css/app.min.css' ) ) :
		$csstime = filemtime( get_template_directory() . '/dist/css/app.min.css' );
		wp_enqueue_style( 'app', get_template_directory_uri() . '/dist/css/app.min.css', array(), $csstime );
	endif;

	// App script
	if ( file_exists( get_template_directory() . '/dist/js/app.min.js' ) ) :
		$jstime = filemtime( get_template_directory() . '/dist/js/app.min.js' );
		wp_enqueue_script( 'app', get_template_directory_uri() . '/dist/js/app.min.js', array(), $jstime, true );
	endif;

});

// Add these to wp config
// define( 'WP_DEBUG', true );
// define( 'WP_DEBUG_DISPLAY', true );
// define( 'WP_DEBUG_LOG', true );