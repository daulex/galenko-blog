<?php

class Awave_Gutenberg
{
	
	public function __construct()
	{
		add_action( 'admin_enqueue_scripts', [$this, 'gutenberg_styles'] );
		add_action( 'allowed_block_types_all', [$this, 'allowed_block_types'] );
		add_action('acf/init', [$this, 'register_blocks']);
	}

	public function gutenberg_styles()
	{
		wp_enqueue_style('awave_gutenberg_styles', get_template_directory_uri() . '/inc/admin-styles.css', '', false, 'all');
	}

	public function allowed_block_types( $allowed_blocks )
	{
		$blocks = array();
		$blocks[] = 'core/block';
	
		foreach( glob( get_template_directory() . '/blocks/**/*.php' ) as $block ){
	
			$block = explode('/', $block);
			$block = end( $block );
			$block = str_replace('.php', '', $block);
			$block = 'acf/' . $block;
			$blocks[] = $block;
		}
	
		return $blocks;
	}

	public function register_blocks() 
	{
		if( function_exists('acf_register_block_type') ) {

			$supports = array(
				'align' => false,
				'templateLock' => 'all'
			);
	
			foreach( glob( get_template_directory() . '/blocks/**/manifest.json' ) as $block ) :
				$data = file_get_contents( $block );
				$data = json_decode( $data );
	
				$my_block = array(
					'name'            => $data->name,
					'title'           => __( $data->title, 'awave' ),
					'render_template' => 'blocks/' . $data->name . '/' . $data->name . '.php',
					'category'        => $data->category,
					'icon'            => $data->icon,
					'mode'            => $data->mode,
					'align'           => false,
					'supports'        => $supports,
				);
	
				if( $data->js === 'Yes' ) :
					$my_block['enqueue_assets'] = function() use ($data) {
						if ( file_exists( get_template_directory() . '/dist/css/' . $data->name . '.min.css' ) ) :
							$csstime = filemtime( get_template_directory() . '/dist/css/' . $data->name . '.min.css');
							wp_enqueue_style(
								$data->name,
								get_template_directory_uri() . '/dist/css/' . $data->name . '.min.css',
								array(),
								$csstime,
								'all'
							);
						endif;
						if ( file_exists( get_template_directory() . '/dist/js/' . $data->name . '.min.js' ) ) :
							$jstime = filemtime( get_template_directory() . '/dist/js/' . $data->name . '.min.js');
							wp_enqueue_script( 
								$data->name,
								get_template_directory_uri() . '/dist/js/' . $data->name . '.min.js',
								array(),
								$jstime,
								true
							);
						endif;
					};
				endif;

				// Example for how to add custom vendor file to specific block
				// if( $data->name == 'guidelines' ) :
				// 	$my_block['enqueue_assets'] = function() use ($data) {
				// 		$csstime = filemtime( get_template_directory() . '/dist/css/' . $data->name . '.min.css');
				// 		wp_enqueue_style(
				// 			$data->name,
				// 			get_template_directory_uri() . '/dist/css/' . $data->name . '.min.css',
				// 			array(),
				// 			$csstime,
				// 			'all'
				// 		);
				// 		if ( file_exists( get_template_directory() . '/dist/js/' . $data->name . '.min.js' ) ) :
				// 			$jstime = filemtime( get_template_directory() . '/dist/js/' . $data->name . '.min.js');
				// 			wp_enqueue_script( 
				// 				$data->name,
				// 				get_template_directory_uri() . '/dist/js/' . $data->name . '.min.js',
				// 				array(),
				// 				$jstime,
				// 				true
				// 			);
				// 		endif;
				// 		wp_enqueue_script( 
				// 			'fancybox',
				// 			'https://cdn.jsdelivr.net/npm/@fancyapps/ui@4.0/dist/fancybox.umd.js',
				// 			array(),
				// 			'1.0.0',
				// 			true
				// 		);
				// 	};
				// endif;
	
				acf_register_block_type( $my_block );
	
			endforeach;
	
		}
	}
}

new Awave_Gutenberg();