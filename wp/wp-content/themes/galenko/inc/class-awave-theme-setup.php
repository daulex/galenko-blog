<?php

/**
 * Sets up the base functionality for our base theme.
 * Also provides functions for adding your own basic functions.
 */
class Awave_Theme_Setup
{
	
	public function __construct()
	{
		// Theme support
		$this->add_theme_support( 'post-thumbnails' );
		$this->add_theme_support( 'title-tag' );
		$this->add_theme_support( 'automatic-feed-links' );
		$this->remove_theme_support( 'core-block-patterns' );

		// Remove
		remove_action( 'wp_head', 'wp_generator' );
		remove_action( 'wp_head', 'wlwmanifest_link' );
		remove_action( 'wp_head', 'wp_shortlink_wp_head' );
		remove_action( 'wp_head', 'rsd_link' );
		remove_action( 'wp_head', 'adjacent_posts_rel_link_wp_head' );
		remove_action( 'wp_head', 'print_emoji_detection_script', 7 );
		remove_action( 'wp_print_styles', 'print_emoji_styles' );
		remove_action( 'wp_body_open', 'wp_global_styles_render_svg_filters' );
		add_action( 'wp_default_scripts', [$this, 'remove_jquery_migrate'] );
		add_action( 'init', [$this, 'disallow_updates'] );

		// Embed container
		add_filter( 'embed_oembed_html', [$this, 'embed_container'], 10, 3 );
		add_filter( 'video_embed_html', [$this, 'embed_container'], 10, 3 );

		// Disable automatic updates
		add_filter( 'automatic_updater_disabled', '__return_true' );

		// Remove default image sizes
		add_filter( 'intermediate_image_sizes_advanced', [$this, 'remove_default_images'], 10, 3 );

		// Reusable blocks
		add_action( 'admin_menu', [$this, 'reusable_blocks_menu'] );

		// Theme CSS to Gutenberg
		add_action( 'after_setup_theme', [$this, 'add_editor_styles'] );

		// Block styles
		add_action( 'wp_enqueue_scripts', [$this, 'remove_block_styles'], 99999 );

		// jQuery footer
		add_action( 'wp_enqueue_scripts', [$this, 'move_jquery_footer'] );

		// Theme Options
		$this->options_page();

		// Tracking codes
		$this->tracking_codes();

		// Tiny MCE
		add_filter( 'tiny_mce_before_init', [$this, 'title_styles_tinymce']);
		add_filter( 'mce_buttons_2', [$this, 'buttons_tinymce']);

		// Gravity Forms
		add_filter( 'gform_confirmation_anchor', '__return_false' );
		add_filter( 'gform_field_css_class', [$this, 'gform_custom_class'], 10, 3 );
		add_filter( 'gform_submit_button', [$this, 'form_submit_button'], 10, 2 );

		// Disable ACF shortcodes
		add_action( 'acf/init', [$this, 'set_acf_settings'] );

		// Remove empty field group message for non admin
		add_filter( 'acf/blocks/no_fields_assigned_message', [$this, 'remove_empty_field_group_message'], 10, 2 );

		// Load Complianz translations
		add_action( 'init', [$this, 'complianz_load_textdomain'] );

		/**
		 * Security stuff
		 */

		 // Disable XML-RPC calls
		add_filter( 'xmlrpc_enabled', '__return_false' );

		// Remove users from REST API
		add_filter( 'rest_endpoints', [$this, 'remove_users_rest'] );

		// Remove author pages from front end
		add_action( 'template_redirect', [$this, 'remove_author_pages'], 1, 1 );

		// Non-specific login error messages
		add_filter( 'login_errors', [$this, 'login_error_message'] );

		// Security headers
		add_filter('wp_headers', [$this, 'security_headers'] );

		// WP Mail SMTP plugin - remove weekly email summaries emails
		add_filter( 'wp_mail_smtp_reports_emails_summary_is_disabled', '__return_true' );

		$this->plugin_licenses();
	}

	/**
	 * Registers theme support for a given feature.
	 * 
	 * @param string $feature The feature being added.
	 */
	public function add_theme_support( $feature )
	{
		add_action('after_setup_theme', function() use ( $feature ) {
			add_theme_support( $feature );
		});
	}

	/**
	 * Deregister theme support for a certain feature
	 * 
	 * @param string $feature The feature being removed
	 */
	public function remove_theme_support( $feature )
	{
		add_action('after_setup_theme', function() use ( $feature ) {
			remove_theme_support( $feature );
		});
	}

	/**
	 * Register a navigation menu location.
	 */
	public function addNavMenus( $args )
	{
		add_action('after_setup_theme', function() use ( $args ) {
			register_nav_menus($args);
		});
	}

	/**
	 * Adds reusable blocks to the admin menu for easier access.
	 */
	public function reusable_blocks_menu() 
	{
		add_menu_page( 
			'linked_url', 
			_x( 'Reusable blocks', 'post type general name' ), 
			'read', 
			'edit.php?post_type=wp_block', 
			'', 
			'dashicons-controls-repeat', 
			40 
		);
	}

	/**
	 * Removes jQuery Migrate
	 */
	public function remove_jquery_migrate( $scripts )
	{
		if ( ! is_admin() && isset( $scripts->registered['jquery'] ) ) :
			$script = $scripts->registered['jquery'];
			if ( $script->deps ) :
				$script->deps = array_diff( $script->deps, array( 'jquery-migrate' ) );
			endif;
		endif;
	}

	/**
	 * Disallow updates for all domains except awave.site (locally)
	 */
	public function disallow_updates()
	{
		define( 'DISALLOW_FILE_EDIT', true );
		if ( strpos( $_SERVER['SERVER_NAME'], 'awave.site' ) === false) :
			define( 'DISALLOW_FILE_MODS', true );
		endif;
	}

	/**
	 * Adds an embed container for all oembed objects.
	 */
	public function embed_container( $html )
	{
		return '<div class="embed-container">' . $html . '</div>';
	}

	/**
	 * Remove the deault image sizes small, medium, large
	 */
	public function remove_default_images( $sizes )
	{
		unset( $sizes['small'] );
		unset( $sizes['medium'] );
		unset( $sizes['large'] );
		unset( $sizes['medium_large'] );
		return $sizes;
	}

	/**
	 * Adds the theme CSS to the Gutenberg editor.
	 */
	public function add_editor_styles()
	{
		add_editor_style();
		add_theme_support( 'editor-styles' );
		add_theme_support( 'align-wide' );
		add_editor_style( 'dist/css/vendor.min.css' );
		add_editor_style( 'dist/css/app.min.css' );
	}

	/**
	 * Removes unneccessary block styles from the frontend.
	 */
	public function remove_block_styles()
	{
		wp_dequeue_style( 'wp-block-library' );
		wp_dequeue_style( 'wp-block-library-theme' );
		wp_dequeue_style( 'wc-blocks-style' );
	}

	/**
	 * If jQuery is used, move it to the footer.
	 */
	public function move_jquery_footer()
	{
		wp_scripts()->add_data( 'jquery', 'group', 1 );
		wp_scripts()->add_data( 'jquery-core', 'group', 1 );
		wp_scripts()->add_data( 'jquery-migrate', 'group', 1 );
	}

	/**
	 * Adds Theme Settings option page
	 */
	public function options_page()
	{
		if( function_exists('acf_add_options_page') ) {
			$theme_options = acf_add_options_page( array(
				'page_title' => __('Theme Settings', 'awave'),
				'menu_title' => __('Theme Settings', 'awave'),
				'menu_slug'	 => 'theme-settings',
				'capability' => 'edit_posts',
				'redirect'   => false
			));
		}
	}

	/**
	 * Function for outputting tracking codes on the page.
	 */
	public function tracking_codes()
	{
		add_action( 'wp_body_open', function() {
			if( class_exists('ACF') ) :
				the_field( 'tracking_codes_body', 'option' );
			endif;
		});
		add_action( 'wp_body_open', function() {
			if( class_exists('ACF') ) :
				the_field( 'tracking_codes_header', 'option' );
			endif;
		});
		add_action( 'wp_body_open', function() {
			if( class_exists('ACF') ) :
				the_field( 'tracking_codes_footer', 'option' );
			endif;
		});
	}

	/**
	 * Adds ability to add header classes, to allow styling a header
	 * into looking like another header.
	 */
	public function title_styles_tinymce( $settings )
	{
		$style_formats = array(
			array(
				'title' => __( 'Title styles', 'awave'),
				'items' => array(
					array(
						'title' => __('Title 1', 'awave'),
						'selector' => 'h1,h2,h3,h4,h5,h6',
						'classes' => 'h1'
					),
					array(
						'title' => __('Title 2', 'awave'),
						'selector' => 'h2,h1,h3,h4,h5,h6',
						'classes' => 'h2'
					),
					array(
						'title' => __('Title 3', 'awave'),
						'selector' => 'h3,h2,h1,h4,h5,h6',
						'classes' => 'h3'
					),
					array(
						'title' => __('Title 4', 'awave'),
						'selector' => 'h4,h2,h3,h1,h5,h6',
						'classes' => 'h4'
					),
					array(
						'title' => __('Title 5', 'awave'),
						'selector' => 'h5,h4,h2,h3,h1,h6',
						'classes' => 'h5'
					),
					array(
						'title' => __('Title 6', 'awave'),
						'selector' => 'h6,h5,h4,h2,h3,h1',
						'classes' => 'h6'
					),
				)
			),
		);
		$settings['style_formats'] = json_encode( $style_formats );
		return $settings;
	}

	public function buttons_tinymce( $buttons )
	{
		array_unshift( $buttons, 'styleselect' );
		return $buttons;
	}

	public function gform_custom_class( $classes, $field, $form )
	{
		$classes .= ' gform_' . $field->type;
		return $classes;
	}

	public function form_submit_button( $button, $form )
	{
		return "<button class='btn btn--primary' id='gform_submit_button_{$form["id"]}'><span>{$form['button']['text']}</span></button>";
	}

	public function set_acf_settings()
	{
		acf_update_setting( 'enable_shortcode', false );
	}

	public function remove_empty_field_group_message( $message, $block_name )
	{
		if ( get_current_user_id() !== 1 ) :
			$message = '';
		endif;
		return $message;
	}

	public function complianz_load_textdomain()
	{
		load_plugin_textdomain( 'complianz-gdpr', false, '/../languages/awave/' );
	}

	public function remove_users_rest( $endpoints )
	{
		if ( isset( $endpoints['/wp/v2/users'] ) ) :
			unset( $endpoints['/wp/v2/users'] );
		endif;
		if ( isset( $endpoints['/wp/v2/users/(?P<id>[\d]+)'] ) ) :
			unset( $endpoints['/wp/v2/users/(?P<id>[\d]+)'] );
		endif;
		return $endpoints;
	}

	public function remove_author_pages()
	{
		$author_query = get_query_var('author');
		if ( is_author() || $author_query ) :
			global $wp_query;
			$wp_query->set_404();
			status_header(404);
		endif;
	}

	public function login_error_message()
	{
		return __('Something is wrong!', 'awave');
	}

	public function security_headers( $headers ){

		if ( !is_admin() ) :
			$headers['X-Frame-Options']        = 'SAMEORIGIN';
			$headers['X-Content-Type-Options'] = 'nosniff';
			$headers['Referrer-Policy']        = 'no-referrer-when-downgrade';
			$headers['Feature-Policy']         = "microphone 'none'";
			$headers['Permissions-Policy']     = "microphone=()";

			if ( is_ssl() ) :
				$headers['Strict-Transport-Security'] = 'max-age=31536000;includeSubDomains';
			endif;
		endif;
		
		return $headers;
		
	}

	public function plugin_licenses()
	{
		define( 'ACF_PRO_LICENSE', 'b3JkZXJfaWQ9NjQ1MjV8dHlwZT1kZXZlbG9wZXJ8ZGF0ZT0yMDE1LTA5LTE4IDE0OjE1OjI1' );
		define( 'SEOPRESS_LICENSE_KEY', 'cf7f7ecc4b15f42a455bb98b6cf9173c' );
		define( 'WPMDB_LICENCE', '818e73f9-f6e7-471c-99a9-92c968dd5f3c' );
		define( 'GF_LICENSE_KEY', '0d837c3a95d4a12bd78c075f2c5d0cd1' );
	}
	
}