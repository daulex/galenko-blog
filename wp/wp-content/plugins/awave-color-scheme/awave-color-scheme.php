<?php
/*
Plugin Name: Awave Color Scheme
Plugin URI: http://www.awave.se/
Description: A color scheme for the WP-admin to match the Awave colors.
*/

// Custom Color Schema
function awave_admin_color_schemes() {

    // Awave
    wp_admin_css_color('awave', __( 'Awave', 'awave-bootstrap'),
                       plugins_url('awave-color-scheme/colors.css'),
                       array( '#222', '#333', '#f3962b', '#f9bf54' )
                      );
}
add_action('admin_init', 'awave_admin_color_schemes');

function set_default_admin_color($user_id) {
    $args = array(
        'ID' => $user_id,
        'admin_color' => 'awave'
    );
    wp_update_user( $args );
}
add_action('user_register', 'set_default_admin_color');

function rename_fresh_color_scheme() {
    global $_wp_admin_css_colors;
    $color_name = $_wp_admin_css_colors['fresh']->name;

    if( $color_name == 'Default' ) {
        $_wp_admin_css_colors['fresh']->name = 'Fresh';
    }
    return $_wp_admin_css_colors;
}
add_filter('admin_init', 'rename_fresh_color_scheme');
