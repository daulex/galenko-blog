<?php

/**
 * Removes all base Gutenberg blocks so we can start adding our own.
 * Blocks are created with a block.json file for each block and
 * managed using Advanced Custom Fields PRO.
 */
class Awave_Gutenberg
{
	
	public function __construct()
	{
		add_action( 'admin_enqueue_scripts', [$this, 'gutenberg_styles'] );
		add_action( 'allowed_block_types_all', [$this, 'allowed_block_types'] );
		add_action( 'init', [$this, 'register_blocks'] );
		add_action( 'wp', [$this, 'register_block_scripts'] );
	}

	public function gutenberg_styles()
	{
		wp_enqueue_style( 
			'awave_gutenberg_styles',
			get_template_directory_uri() . '/inc/css/gutenberg-styles.css',
			'',
			false,
			'all'
		);
	}

	public function allowed_block_types( $allowed_blocks ){
		$blocks = [
      'core/image',
      'core/paragraph',
      'core/heading',
      'core/list',
      'core/list-item',
      'core/pullquote	',
      'core/separator',
      'core/post-featured-image',
      'core/block'
    ];
	
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
		if ( ! function_exists( 'register_block_type' ) ) return;
		foreach( glob( get_template_directory() . '/blocks/**/block.json' ) as $block ) :
			register_block_type( $block );
		endforeach;
	}

	public function register_block_scripts()
	{

		foreach( glob( get_template_directory() . '/blocks/**/block.json' ) as $block ) :
			$data = file_get_contents( $block );
			$data = json_decode( $data );

			$deps = array();
			$vendorScripts = array();
			$vendorStyles = array();

			if ( isset( $data->awaveVendorScripts ) ) :
				if ( is_array( $data->awaveVendorScripts ) ) :
					foreach ( $data->awaveVendorScripts as $script ) :
						$vendorScripts[] = $script;
					endforeach;
				else:
					$vendorScripts[] = $data->awaveVendorScripts;
				endif;
			endif;

			if ( isset( $data->awaveVendorStyles ) ) :
				if ( is_array( $data->awaveVendorStyles ) ) :
					foreach ( $data->awaveVendorStyles as $style ) :
						$vendorStyles[] = $style;
					endforeach;
				else:
					$vendorStyles[] = $data->awaveVendorStyles;
				endif;
			endif;

			if ( has_block( $data->name ) ) :

				if ( !empty( $vendorScripts ) ) :
					foreach ( $vendorScripts as $script ) :
						if ( file_exists( get_template_directory() . '/dist/vendor/' . $script ) ) :
							$script_name = explode('/', $script);
							$script_name = end( $script_name );
							$script_name = str_replace( '.js', '', $script_name );
							$script_name = str_replace( '.min', '', $script_name );
							$deps[] = $script_name;
							$jstime = filemtime( get_template_directory() . '/dist/vendor/' . $script);
							wp_enqueue_script(
								$script_name,
								get_template_directory_uri() . '/dist/vendor/' . $script,
								array(),
								$jstime,
								true
							);
						endif;
					endforeach;
				endif;

				if ( isset( $data->awaveScripts ) && $data->awaveScripts === true ) :
					$script_name = str_replace( 'acf/', '', $data->name );
					if ( file_exists( get_template_directory() . '/dist/js/' . $script_name . '.min.js' ) ) :
						$jstime = filemtime( get_template_directory() . '/dist/js/' . $script_name . '.min.js' );
						wp_enqueue_script(
							$script_name,
							get_template_directory_uri() . '/dist/js/' . $script_name . '.min.js',
							$deps,
							$jstime,
							true
						);
					endif;
				endif;

				if ( !empty( $vendorStyles ) ) :
					foreach ( $vendorStyles as $style ) :
						if ( file_exists( get_template_directory() . '/dist/vendor/' . $style ) ) :
							$csstime = filemtime( get_template_directory() . '/dist/vendor/' . $style );
							$style_name = explode('/', $style);
							$style_name = end( $style_name );
							$style_name = str_replace( '.css', '', $style_name );
							$style_name = str_replace( '.min', '', $style_name );

							wp_enqueue_style(
								$style_name,
								get_template_directory_uri() . '/dist/vendor/' . $style,
								array(),
								$csstime
							);
						endif;
					endforeach;
				endif;

			endif;

		endforeach;
	}

	public static function get_preview_image( $block_image, $block_name )
	{
		$output = '';
		if ( !$block_image ) return $output;
		$image = get_template_directory() . '/blocks/' . str_replace( 'acf/', '', $block_name ) . '/' . $block_image;
		if ( file_exists( $image ) ) :
			$imagetime = filemtime( $image );
			$image_src = get_template_directory_uri() . '/blocks/' . str_replace( 'acf/', '', $block_name ) . '/' . $block_image;
			$output = '<img src="' . $image_src .  '?v=' . $imagetime . '" />';
		else:
			$output = '<div class="block-editor-inserter__preview-content-missing">' . __( 'No preview available', 'awave' ) . '</div>';
		endif;
		return apply_filters('awave_block_preview_image', $output, $block_image, $block_name );
	}
}

new Awave_Gutenberg();