<?php get_header(); ?>
<?php if( have_posts() ) : ?>
<section class="blog block">
	<div class="block__container">
		<div class="block__row">
			<?php while ( have_posts() ) : the_post(); ?>
				<?php get_template_part('templates/post'); ?>
			<?php endwhile; ?>
		</div>
		
		<div class="block__row">
			<nav class="col col--12">
				<?php
					global $wp_query;
					$big = 999999999; // need an unlikely integer
					echo paginate_links( array(
						'base' => str_replace( $big, '%#%', esc_url( get_pagenum_link( $big ) ) ),
						'format' => '?paged=%#%',
						'current' => max( 1, get_query_var('paged') ),
						'total' => $wp_query->max_num_pages
					) );
				?>
			</nav>
		</div>
	</div>
</section>
<?php endif; ?>
<?php get_footer(); ?>
