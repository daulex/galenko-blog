<?php

/**
 * Class responsible for most hooks.
 * For example, can be used for registrering custom post types
 */
class galenko_Custom_Hooks {
	public function __construct() {
		add_filter( 'body_class', [$this, 'body_classes'] );
		add_action( 'init', [$this, 'cpt_project'] );
		add_action( 'excerpt_more', [$this, 'excerpt_more'] );
	}

	public function body_classes( $classes )
	{
		$classes[] = 'frontend';
		return $classes;
	}

  /**
   * Change excerpt more symbol from [...] to ...
   */
  public function excerpt_more( $more ) {
    return '...';
  }


	/**
	 * Example of generating a Custom Post Type.
	 * Remove and create your own if needed.
	 */
	public function cpt_project()
	{
		register_post_type('project',
      array(
        'labels'      => array(
          'name'          => __('Projects', 'awave'),
          'singular_name' => __('Project', 'awave'),
        ),
          'public'      => true,
          'has_archive' => false,
          'supports'    => array('title', 'editor', 'thumbnail', 'excerpt', 'featured_image'),
      )
    );
	}
}

new galenko_Custom_Hooks();