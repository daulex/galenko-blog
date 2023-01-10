<?php 
get_header();
$custom_functions = new Galenko_Custom_Functions;
?>
<?php if( have_posts() ) : ?>
<section class="blog block">
	<div class="block__container">
		<?php if(is_category()): ?>
		<div class="category-heading">
			<?php echo $custom_functions->kg_icons('tag'); ?>
			<?php
				$category = get_the_category();
				echo $category[0]->cat_name;
			?>
		</div>
		<?php endif; ?>
		<div class="block__row">
			<?php while ( have_posts() ) : the_post(); ?>
				<?php get_template_part('templates/post'); ?>
			<?php endwhile; ?>
		</div>
		
		<div class="pagination">
			<nav>
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
