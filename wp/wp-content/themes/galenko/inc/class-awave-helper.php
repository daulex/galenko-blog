<?php

/**
 * Helper functions for the basic needs.
 * Feel free to add your own, if your theme demands it.
 * 
 * How to use:
 * $helper = new Awave_Helper();
 * $header = $helper->generate_header( $args );
 */
class Awave_Helper {

	/**
	 * Generates a header
	 * 
	 * @param array $args {
	 * 		Array of arguments. Only $text is required to generate output.
	 * 
	 * 		@type string $text  Header text
	 * 		@type string $tag   Optional. Header tag. Defaults to 'h1'
	 * 		@type string $class Optional. Header class
	 * }
	 */
	public function generate_header( $args ) {
		$output = '';

		$defaults = array(
			'text'  => '',
			'tag'   => 'h1',
			'class' => ''
		);

		$args = wp_parse_args( $args, $defaults );

		if ( ! $args['text'] )
			return $output;

		$output .= '<' . $args['tag'];
		if ( $args['class'] )
			$output .= ' class="' . $args['class'] . '"';
		$output .= '>';
		$output .= $args['text'];
		$output .= '</' . $args['tag'] . '>';

		return $output;
	}

	/**
	 * Generates a paragraph
	 * 
	 * @param array $args {
	 * 		Array of arguments. Only $text is required to generate output.
	 * 
	 * 		@type string $text  Paragraph text
	 * 		@type string $class Optional. Paragraph class
	 * }
	 */
	public function generate_paragraph( $args = '' ) {
		$output = '';

		$defaults = array(
			'text'  => '',
			'class' => ''
		);

		$args = wp_parse_args( $args, $defaults );

		if ( ! $args['text'] )
			return $output;

		$output .= '<p';
		if ( $args['class'] )
			$output .= ' class="' . $args['class'] . '"';
		$output .= '>';
		$output .= $args['text'];
		$output .= '</p>';

		return $output;
	}

	/**
	 * Generates an image from an ACF image field.
	 * 
	 * @param array $args {
	 * 		Array of arguments. Only $image is required to generate output.
	 * 
	 * 		@type string $image        ACF image object
	 * 		@type string $image_size   Image size. Defaults to full. Not applicable if SVG file.
	 * 		@type string $class        Optional. Image class
	 * 		@type bool   $figure       Optional. Generate a figure
	 * 		@type string $figure_class Optional. Figure class (requires $figure to be true)
	 * }
	 */
	public function generate_acf_image( $args = array() ) {
		$output = '';

		$defaults = array(
			'image'        => '',
			'image_size'   => 'full',
			'class'        => '',
			'figure'       => false,
			'figure_class' => ''
		);

		$args = wp_parse_args( $args, $defaults );

		if ( ! $args['image'] )
			return $output;

		if ( $args['figure'] ) :
			$output .= '<figure';
			if ( $args['figure_class'] )
				$output .= ' class="' . $args['figure_class'] . '"';
			$output .= '>';
		endif;

		$image = $args['image'];

		if ( $image['mime_type'] == 'image/svg+xml' ) :
			$output .= $this->load_svg($image['url']);
		else:
			$attr = array();
			if ( $args['class'] )
				$attr['class'] = $args['class'];

			$output .= wp_get_attachment_image( 
				$image['ID'], 
				$args['image_size'], 
				false, 
				$attr
			);
		endif;

		if ( $args['figure'] ) :
			$output .= '</figure>';
		endif;

		return $output;
	}

	/**
	 * Returns SVG content from URL.
	 */
	public function load_svg( $path ) {
		if  ( strpos( $path , 'http' ) !== FALSE ) {
			$path = parse_url($path, PHP_URL_PATH);
			$filename = ABSPATH . $path;
		} else {
			$filename = get_template_directory() . $path;
		}
	
		if(is_multisite()) :
			$blog_id = get_current_blog_id();
			if ( !is_main_site($blog_id) ) :
				$dom = get_blog_details()->path;
				$filename = str_replace($dom, '', $filename);
			endif;
		endif;
	
		if (file_exists($filename)) :
			$handle = fopen( $filename, 'r' );
			return fread( $handle, filesize( $filename ) );
		else:  
			return;
		endif;
	}

	/**
	 * Returns if user agent is PageSpeed/LightHouse.
	 */
	public function is_pagespeed() {
		if (strpos($_SERVER['HTTP_USER_AGENT'], 'Chrome-Lighthouse') === false) :
			return true;
		endif;
		
		return false;
	}
}