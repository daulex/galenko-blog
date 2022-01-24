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
		add_action( 'wp_enqueue_scripts', [$this, 'remove_block_styles'] );

		// jQuery footer
		add_action( 'wp_enqueue_scripts', [$this, 'move_jquery_footer'] );

		// Remove Posts from admin
		// add_action('admin_menu', [$this, 'post_remove_admin'] );

		// Theme Options
		$this->options_page();

		// Tracking codes
		$this->tracking_codes();

		// Tiny MCE
		add_filter( 'tiny_mce_before_init', [$this, 'title_styles_tinymce']);
		add_filter( 'mce_buttons_2', [$this, 'buttons_tinymce']);

		// Gravity Forms
		add_filter( 'gform_confirmation_anchor', '__return_false' );
		add_filter( 'gform_custom_class', [$this, 'gform_custom_class'], 10, 2 );
		add_filter( 'form_submit_button', [$this, 'form_submit_button'], 10, 2 );
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
	 * Enqueue a CSS stylesheet.
	 */
	public function addStyle( $handle, $src = '', $deps = array(), $ver = '', $media = 'all' )
	{
		add_action( 'wp_enqueue_scripts', function() use ( $handle, $src, $deps, $ver, $media ) {
			wp_enqueue_style($handle, $src, $deps, $ver, $media);
		});
	}

	/**
	 * Enqueue a JavaScript file.
	 */
	public function addScript( $handle, $src = '', $deps = array(), $ver = '', $in_footer = false )
	{
		add_action( 'wp_enqueue_scripts', function() use ( $handle, $src, $deps, $ver, $in_footer ) {
			wp_enqueue_script($handle, $src, $deps, $ver, $in_footer);
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
		wp_dequeue_style( 'wc-block-style' );
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
	 * Remove regular posts from admin
	 */
	public function post_remove_admin()
	{
		remove_menu_page('edit.php');
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

	public function title_styles_tinymce( $settings )
	{
		$style_formats = array(
			array(
				'title' => __( 'Title styles', 'awave'),
				'items' => array(
					array(
						'title' => __('Title 1', 'awave'),
						'selector' => 'h1,h2,h3,h4',
						'classes' => 'h1'
					),
					array(
						'title' => __('Title 2', 'awave'),
						'selector' => 'h2,h1,h3,h4',
						'classes' => 'h2'
					),
					array(
						'title' => __('Title 3', 'awave'),
						'selector' => 'h3,h2,h1,h4',
						'classes' => 'h3'
					),
					array(
						'title' => __('Title 4', 'awave'),
						'selector' => 'h4,h2,h3,h1',
						'classes' => 'h4'
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
	
}