<article class="post editor_content" id="<?php echo $post->ID; ?>">
	<h2><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h2>
	<?php the_excerpt(); ?>
	<button class="read-more">Read more</button>
</article>
