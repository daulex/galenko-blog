<?php
global $custom_functions;
/**
 * github-links Block Template.
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
$id = 'github-links-' . $block['id'];
if (!empty($block['anchor'])) :
	$id = $block['anchor'];
endif;

// Create class attribute allowing for custom 'className' and 'align' values.
$className = 'block github-links';
if (!empty($block['className'])) :
	$className .= ' ' . $block['className'];
endif;
if (!empty($block['align'])) :
	$className .= ' align' . $block['align'];
endif;

$className = apply_filters( 'awave_block_class', $className, $block, $post_id );

// Load values and assing defaults.
$download = get_field('download');
$star = get_field('star');
$repo = get_field('repo');

?>
<section id="<?php echo esc_attr($id); ?>" class="<?php echo esc_attr($className); ?>">
<div class="container">
  <div class="row">
    <div class="row__col">
    
      <?php if($star): ?>
      <a href="https://github.com/daulex/<?=$repo?>" class="github-btn" title="View on GitHub">
        <?php echo $custom_functions->kg_icons('github'); ?>
        <span>View on Github</span>
      </a>
      <?php endif; ?>
      <?php if($download): ?>
      <a href="https://github.com/daulex/<?=$repo?>/archive/HEAD.zip" class="github-btn" title="Download">
        <?php echo $custom_functions->kg_icons('download'); ?>
        <span>Download</span>
      </a>
      <?php endif; ?> 
    </div>
  </div>
</div>
</section>