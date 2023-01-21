<?php

/**
 * welcome Block Template.
 *
 * @param	 array $block The block settings and attributes.
 * @param	 string $content The block inner HTML (empty).
 * @param	 bool $is_preview True during AJAX preview.
 * @param	 (int|string) $post_id The post ID this block is saved to.
 */

if( isset( $block['data']['preview_image_help'] )  ) :
	echo Awave_Gutenberg::get_preview_image( $block['data']['preview_image_help'], $block['name'] );
	return;
endif;

// Create id attribute allowing for custom 'anchor' value.
$id = 'welcome-' . $block['id'];
if (!empty($block['anchor'])) :
	$id = $block['anchor'];
endif;

// Create class attribute allowing for custom 'className' and 'align' values.
$className = 'block welcome';
if (!empty($block['className'])) :
	$className .= ' ' . $block['className'];
endif;
if (!empty($block['align'])) :
	$className .= ' align' . $block['align'];
endif;

$className = apply_filters( 'awave_block_class', $className, $block, $post_id );

// Load values and assing defaults.
// $header = get_field('header');
$header = "Welcome to the new site";
$roles = [
  'WordPress developer',
  'Full-stack developer',
  'Problem solver',
  'Web Consultant'
];
$current = rand(0,3);
?>
<section id="<?php echo esc_attr($id); ?>" class="<?php echo esc_attr($className); ?>">
  <div class="container">
    <div class="row">
      <div class="row__col row__col--md-7">
        <h2><em>Coding since 1999</em></h2>
        <p>I wear many hats and frequently participate during different stages of web site and application production.</p>
        <p>My strongest skill is frontend web development.</p>
      </div>
    </div>
  </div>
</section>