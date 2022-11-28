<?php

/**
 * Class responsible for most hooks.
 * For example, can be used for registrering custom post types
 */
class CUSTOMER_Custom_Hooks {
	public function __construct() {
		add_filter( 'body_class', [$this, 'body_classes'] );
		add_action( 'init', [$this, 'generate_custom_cpt'] );
	}

	public function body_classes( $classes )
	{
		$classes[] = 'frontend';
		return $classes;
	}

	/**
	 * Example of generating a Custom Post Type.
	 * Remove and create your own if needed.
	 */
	public function generate_custom_cpt()
	{
		$labels = array(
			'name'                  => _x( 'Post Types', 'Post Type General Name', 'awave' ),
			'singular_name'         => _x( 'Post Type', 'Post Type Singular Name', 'awave' ),
			'menu_name'             => __( 'Post Types', 'awave' ),
			'name_admin_bar'        => __( 'Post Type', 'awave' ),
			'archives'              => __( 'Item Archives', 'awave' ),
			'attributes'            => __( 'Item Attributes', 'awave' ),
			'parent_item_colon'     => __( 'Parent Item:', 'awave' ),
			'all_items'             => __( 'All Items', 'awave' ),
			'add_new_item'          => __( 'Add New Item', 'awave' ),
			'add_new'               => __( 'Add New', 'awave' ),
			'new_item'              => __( 'New Item', 'awave' ),
			'edit_item'             => __( 'Edit Item', 'awave' ),
			'update_item'           => __( 'Update Item', 'awave' ),
			'view_item'             => __( 'View Item', 'awave' ),
			'view_items'            => __( 'View Items', 'awave' ),
			'search_items'          => __( 'Search Item', 'awave' ),
			'not_found'             => __( 'Not found', 'awave' ),
			'not_found_in_trash'    => __( 'Not found in Trash', 'awave' ),
			'featured_image'        => __( 'Featured Image', 'awave' ),
			'set_featured_image'    => __( 'Set featured image', 'awave' ),
			'remove_featured_image' => __( 'Remove featured image', 'awave' ),
			'use_featured_image'    => __( 'Use as featured image', 'awave' ),
			'insert_into_item'      => __( 'Insert into item', 'awave' ),
			'uploaded_to_this_item' => __( 'Uploaded to this item', 'awave' ),
			'items_list'            => __( 'Items list', 'awave' ),
			'items_list_navigation' => __( 'Items list navigation', 'awave' ),
			'filter_items_list'     => __( 'Filter items list', 'awave' ),
		);
		$args = array(
			'label'                 => __( 'Post Type', 'awave' ),
			'description'           => __( 'Post Type Description', 'awave' ),
			'labels'                => $labels,
			'supports'              => false,
			'hierarchical'          => false,
			'public'                => true,
			'show_ui'               => true,
			'show_in_menu'          => true,
			'menu_position'         => 5,
			'show_in_admin_bar'     => true,
			'show_in_nav_menus'     => true,
			'can_export'            => true,
			'has_archive'           => true,
			'exclude_from_search'   => false,
			'publicly_queryable'    => true,
			'capability_type'       => 'page',
		);
		register_post_type( 'my_post_type', $args );
	}
}

new CUSTOMER_Custom_Hooks();