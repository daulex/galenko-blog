<?php
global $custom_functions;
/**
 * Time since Block Template.
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
$id = 'time-since-' . $block['id'];
if (!empty($block['anchor'])) :
	$id = $block['anchor'];
endif;

// Create class attribute allowing for custom 'className' and 'align' values.
$className = 'block time-since';
if (!empty($block['className'])) :
	$className .= ' ' . $block['className'];
endif;
if (!empty($block['align'])) :
	$className .= ' align' . $block['align'];
endif;

$className = apply_filters( 'awave_block_class', $className, $block, $post_id );

// Load values and assing defaults.
$time_since = get_field('time_since_items');

if($time_since):
?>
<section id="<?php echo esc_attr($id); ?>" class="<?php echo esc_attr($className); ?>">
<?php foreach($time_since as $r): if(!$r['title']) continue; ?>
  <div class="time-since-item">
    <div class="time-since-date"><?php echo $custom_functions->get_time_ago(strtotime($r['date'])); ?></div>
    <div class="time-since-title"><?php echo $r['title']; ?></div>
    <div class="time-since-relative"><?php echo date("d/m/y", strtotime($r['date'])); ?></div>
  </div>
<?php endforeach; ?>
</section>
<?php endif; ?>