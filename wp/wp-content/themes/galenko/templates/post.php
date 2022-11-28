<article class="col-12 post editor_content" id="<?php echo $post->ID; ?>">
	<h2><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h2>
	<?php the_excerpt(); ?>
	<a class="read-more" href="<?php the_permalink(); ?>"><?php _e('Read more','awave'); ?></a>
</article>
