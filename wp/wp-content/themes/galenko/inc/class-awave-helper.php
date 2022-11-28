<?php

/**
 * Helper functions for the basic needs.
 * Feel free to add your own, if your theme demands it.
 * 
 * How to use:
 * $header = Awave_Helper::generate_header( $args );
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
	 * 		@type string $link_url Optional. Link url
	 * 		@type string $link_url Optional. Link target. Requires link url
	 * }
	 * 
	 * @return string The header output.
	 */
	public static function generate_header( $args ) {
		$output = '';

		$defaults = array(
			'text'        => '',
			'tag'         => 'h1',
			'class'       => '',
			'link_url'    => '',
			'link_target' => '',
		);

		$args = wp_parse_args( $args, $defaults );

		if ( ! $args['text'] )
			return $output;

		$output .= '<' . esc_attr( $args['tag'] );
		if ( $args['class'] )
			$output .= ' class="' . esc_attr( $args['class'] ) . '"';
		$output .= '>';
		if ( $args['link_url'] ) :
			$output .= '<a href="' . esc_url( $args['link_url'] ) . '"';
			if ( $args['link_target'] ) $output .= ' target="' . esc_attr( $args['link_target'] ) . '"';
			$output .= '>';
		endif;
		$output .= wp_kses_post( $args['text'] );
		if ( $args['link_url'] ) :
			$output .= '</a>';
		endif;
		$output .= '</' . esc_attr( $args['tag'] ) . '>';

		return $output;
	}

	/**
	 * Generates a paragraph
	 * 
	 * @param array $args {
	 * 		Array of arguments. Only $text is required to generate output.
	 * 
	 * 		@type string $text  Paragraph text.
	 * 		@type string $class Optional. Paragraph class.
	 * }
	 * 
	 * @return string The paragraph output.
	 */
	public static function generate_paragraph( $args = '' ) {
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
			$output .= ' class="' . esc_attr( $args['class'] ) . '"';
		$output .= '>';
		$output .= wp_kses_post( $args['text'] );
		$output .= '</p>';

		return $output;
	}

	/**
	 * Generates an image from an ACF image field/image ID.
	 * 
	 * @param array $args {
	 * 		Array of arguments. Only $image is required to generate output.
	 * 
	 * 		@type (array|int) $image      ACF image object/image ID
	 * 		@type string $image_size      Image size. Defaults to full. Not applicable if SVG file.
	 * 		@type string $class           Optional. Image class. Not applicable if SVG file.
	 * 		@type array  $attributes      Optional. Extra attributes for your image. Not applicable if SVG file.
	 * 		@type bool   $figure          Optional. Generate a figure.
	 * 		@type string $figure_class    Optional. Figure class (requires $figure to be true).
	 *  	@type string $link            Optional. URL for linking the image.
	 * 		@type array  $link_attributes Optional. Extra attributes for your link. Not applicable if there's no link
	 * 		@type string $caption         Optional. Generates image text. Forces figure to be true.
	 * }
	 * 
	 * @return string The image output.
	 */
	public static function generate_image( $args = array() ) {
		$output = '';

		$defaults = array(
			'image'           => '',
			'image_size'      => 'full',
			'class'           => '',
			'attributes'      => array(),
			'figure'          => false,
			'figure_class'    => '',
			'link'            => '',
			'link_attributes' => array(),
			'caption'         => ''
		);

		$args = wp_parse_args( $args, $defaults );

		if ( ! $args['image'] )
			return $output;

		if ( is_array($args['image']) ) :
			$image_id = $args['image']['ID'];
			$image_url = $args['image']['url'];
		else:
			$image_id = $args['image'];
			$image_info = wp_get_attachment_image_src( 
				$image_id, 
				$args['image_size'], 
				false, 
			);
			if ( !$image_info )
				return $output;
			$image_url = $image_info[0];
		endif;

		$ext = pathinfo($image_url, PATHINFO_EXTENSION);

		if ( $args['figure'] || $args['caption'] ) :
			$output .= '<figure';
			if ( $args['figure_class'] )
				$output .= ' class="' . esc_attr( $args['figure_class'] ) . '"';
			$output .= '>';
		endif;

		if ( $args['link'] ) :
			$output .= '<a href="' . $args['link'] . '"';
			if ( $args['link_attributes'] ) :
				foreach ( $args['link_attributes'] as $name => $value ) :
					$output .= " $name=" . '"' . esc_attr( $value ) . '"';
				endforeach;
			endif;
			$output .= '>';
		endif;

		if ( $ext === 'svg' ) :
			$output .= self::load_svg($image_url);
		else:
			if ( $args['class'] ) :
				$args['attributes']['class'] = $args['class'];
			endif;

			$output .= wp_get_attachment_image( 
				$image_id, 
				$args['image_size'], 
				false, 
				$args['attributes']
			);
		endif;

		if ( $args['link'] ) :
			$output .= '</a>';
		endif;

		if ( $args['caption'] ) :
			$output .= '<figcaption>';
				$output .= $args['caption'];
			$output .= '</figcaption>';
		endif;

		if ( $args['figure'] || $args['caption'] ) :
			$output .= '</figure>';
		endif;

		return $output;
	}

	/**
	 * @deprecated Since you can provide both image ID and ACF image object, this function has been renamed.
	 */
	public static function generate_acf_image( $args = array() ) {
		_deprecated_function(
			__METHOD__,
			'5.0.0',
			'generate_image'
		);
		return self::generate_image( $args );
	}

	/**
	 * Generates a link from the ACF field type link.
	 * 
	 * @param array $args {
	 * 		Array of arguments. Only $link is required to generate output.
	 * 
	 * 		@type array $link             ACF link object
	 * 		@type string $class           Optional. Class to be added to the link.
	 * 		@type boolean $container      Optional. Sets a container element. Accepts p, div, span or nav
	 * 		@type string $container_class Optional. Sets a class for the container element. (Requires $container to be true.)
	 * 		@type array  $link_attributes Optional. Extra attributes for your link.
	 * }
	 * 
	 * @return string The link output.
	 */
	public static function generate_acf_link( $args = array() )
	{
		$output = '';

		$defaults = array(
			'link'            => '',
			'class'           => '',
			'container'       => false,
			'container_class' => '',
			'link_attributes' => array()
		);

		$args = wp_parse_args( $args, $defaults );

		$link            = $args['link'];
		$class           = $args['class'];
		$container       = $args['container'];
		$container_class = $args['container_class'];
		$link_attributes = $args['link_attributes'];

		if ( !$link )
			return $output;

		if ( $container ) :
			$allowed_tags = array('p', 'div', 'span', 'nav');
			if ( is_string( $container ) && in_array( $container, $allowed_tags, true ) ) :
				$container_class = $container_class ? ' class="' . esc_attr( $container_class ) . '"' : '';
				$output .= '<' . $container . $container_class . '>';
			endif;
		endif;

		$output .= '<a ';
		if ( isset($link['target']) && $link['target'] ) :
			$output .= 'target="' . esc_attr( $link['target'] ) . '" ';
		endif;
		if ( $class ) :
			$output .= 'class="' . $class . '" ';
		endif;
		if ( $link_attributes ) :
			foreach ( $link_attributes as $name => $value ) :
				$output .= " $name=" . '"' . esc_attr( $value ) . '"';
			endforeach;
		endif;
		$output .= 'href="' . esc_url( $link['url'] ) . '"';
		$output .= '>';
		$output .= wp_kses_post( $link['title'] );
		$output .= '</a>';

		if ( $container ) {
			$output .= '</' . esc_attr( $container ) . '>';
		}

		return $output;
	}

	/**
	 * Returns SVG content from URL.
	 * 
	 * @param string $path The URI to the SVG file.
	 * 
	 * @return string Output containing the SVG source.
	 */
	public static function load_svg( $path ) {
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
	 * Generate a custom excerpt.
	 * 
	 * @param int|WP_Post $post Optional. Post ID or WP_Post object. Default is global $post.
	 * @param array $args {
	 * 		Array of arguments. Only $link is required to generate output.
	 * 
	 *      @type int $length  Number of words. Default is 55.
	 *      @type string $more Read more-text after the excerpt
	 * }
	 * 
	 * @return string Post excerpt.
	 */
	public static function generate_excerpt( $post = null, $args = array() )
	{
		$output = '';

		$post = get_post( $post );
		if ( empty( $post ) )
			return $output;

		$defaults = array(
			'length' => 55,
			'more'   => '',
		);

		$args = wp_parse_args( $args, $defaults );
		
		$content = $post->post_content;
		$content = wp_trim_words( $content, $args['length'], $args['more'] );
		$content = apply_filters( 'the_content', $content );

		$output = $content;

		return $output;
	}

	/**
	 * Generate a div for WYSIWYG content
	 * 
	 * @param array $args {
	 * 		Array of arguments. Only $content is required to generate output.
	 * 
	 *      @type string $content   WYWIWYG content
	 *      @type string $container Container tag. If empty, no container
	 *      @type array $classes    Array of classes for container. Requires a container tag
	 * }
	 * 
	 * @return string WYSIWYG content.
	 */
	public static function generate_wysiwyg( $args = array() )
	{
		$output = '';

		$defaults = array(
			'content'   => '',
			'container' => 'div',
			'classes'   => array('editor-content')
		);

		$args = wp_parse_args( $args, $defaults );

		if ( !$args['content'] )
			return $output;

		if ( $args['container'] ) :
			$output .= '<' . $args['container'] . ' class="' . esc_attr( implode( ' ', $args['classes'] ) ) . '">';
		endif;
			$output .= $args['content'];
		if ( $args['container'] ) :
			$output .= '</' . $args['container'] . '>';
		endif;

		return $output;
	}

	/**
	 * Returns if user agent is PageSpeed/LightHouse.
	 * 
	 * @return boolean True if user agent is PageSpeed or Lighthouse.
	 */
	public static function is_pagespeed() {
		if (strpos($_SERVER['HTTP_USER_AGENT'], 'Chrome-Lighthouse') === false) :
			return true;
		endif;
		
		return false;
	}
}